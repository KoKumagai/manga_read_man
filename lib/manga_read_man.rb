require "manga_read_man/manga"

module MangaReadMan
  BASE_URL = 'http://www.mangareader.net/'

  def self.image_urls(title, chapter = nil)
    manga = Manga.new(title, chapter)
    manga.execute
  end
end
