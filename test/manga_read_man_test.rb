require 'test_helper'

class MangaReadManTest < Minitest::Test
  def setup
    @title = 'getenrou'
  end

  def test_image_urls_when_one_chapter
    assert_equal(MangaReadMan.image_urls(@title, 1), ExpectData::FOR_ONE_CHAPTER)
  end

  def test_image_urls_when_range_chapter
    assert_equal(MangaReadMan.image_urls(@title, 1..2), ExpectData::FOR_RANGE_CHAPTER)
  end

  def test_image_urls_when_chapter_is_nil
    assert_equal(MangaReadMan.image_urls(@title), ExpectData::FOR_ALL_CHAPTER)
  end

  def test_image_urls_when_invalid_title
    assert_raises(MangaReadMan::Manga::TitleError) { MangaReadMan.image_urls('invalidtitle') }
  end

  def test_image_urls_when_chapter_is_a_string
    assert_raises(MangaReadMan::Manga::ChapterError) { MangaReadMan.image_urls(@title, 'a') }
  end

  def test_image_urls_when_chapter_is_range_string
    assert_raises(MangaReadMan::Manga::ChapterError) { MangaReadMan.image_urls(@title, 'a'..'z') }
  end

  def test_image_urls_when_start_chapter_is_bigger_than_last_chapter
    assert_raises(MangaReadMan::Manga::ChapterError) { MangaReadMan.image_urls(@title, 2..1) }
  end

  def test_image_urls_when_start_chapter_is_negative_number
    assert_raises(MangaReadMan::Manga::ChapterError) { MangaReadMan.image_urls(@title, -1..2) }
  end

  def test_image_urls_when_last_chapter_is_bigger_than_max_chapter
    assert_raises(MangaReadMan::Manga::ChapterError) { MangaReadMan.image_urls(@title, 1..10) }
  end
end
