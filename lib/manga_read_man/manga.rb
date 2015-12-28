require 'nokogiri'
require 'anemone'

module MangaReadMan

  class Manga
    class TitleError < StandardError; end
    class ChapterError < StandardError; end

    def initialize(title, chapters)
      @title = parse_title!(title)
      @chapters = parse_chapters!(@title, chapters)
    end

    def execute
      image_urls_of_each_chapter = []
      @chapters.each do |chapter|
        image_urls_of_each_chapter << {chapter => image_urls(@title, chapter)}
      end
      image_urls_of_each_chapter
    end

    private
    def parse_title!(title)
      response = Net::HTTP.get_response(URI.parse(title_url(title)))
      raise TitleError.new('invalid title: not found') if response.code == '404'
      title
    end

    def parse_chapters!(title, chapters)
      chapters = build_chapters!(title, chapters)

      if !(chapters.first.is_a?(Integer) && chapters.last.is_a?(Integer))
        raise ChapterError.new('invalid chapter: should be integer')
      elsif !(chapters.first <= chapters.last)
        raise ChapterError.new('invalid chapter: should be first <= last')
      elsif !(1 <= chapters.first)
        raise ChapterError.new('invalid chapter: should be 1 <= first')
      elsif !(chapters.last <= max_chapter(title))
        raise ChapterError.new('invalid chapter: should be last <= max chapter')
      end
      chapters
    end

    def build_chapters!(title, chapters)
      return Range.new(1, max_chapter(title)) if chapters.nil?

      case chapters
      when Range;   chapters
      when Integer; Range.new(chapters, chapters)
      else raise ChapterError.new('invalid chapter: should be range, integer or nil')
      end
    end

    def image_urls(title, chapter)
      target_url = title_url(title) + "/#{chapter}/1"
      skip_pattern = /\/.+-.+-1\/#{title}\/chapter-#{chapter}\.html/
      focus_pattern = /\/#{title}\/#{chapter}\/.+|\/.+\/#{title}\/chapter-#{chapter}\.html/
      urls = []

      Anemone.crawl(target_url) do |anemone|
        anemone.skip_links_like(skip_pattern)

        anemone.focus_crawl do |page|
          page.links.keep_if { |link| link.to_s.match(focus_pattern) }
        end

        anemone.on_every_page do |page|
          image = page.doc.xpath('//img[@id="img"]')
          urls << image.attribute('src').value unless image.empty?
        end
      end
      urls
    end

    def title_url(title)
      MangaReadMan::BASE_URL + title
    end

    def max_chapter(title)
      max = 0
      doc = Nokogiri::HTML(open(title_url(title)))
      doc.xpath('//div[@id="chapterlist"]/table/tr/td/a').each do |node|
        href = node.attribute('href').value
        max = href.split(/\//).last
      end
      max.to_i
    end
  end
end
