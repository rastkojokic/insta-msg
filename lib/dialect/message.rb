class Dialect::Message
  SUPPORTED_INTERPUNCTION_SIGNS = [".", ",", "!", "?", ":", ";", "-"]

  def initialize(text)
    @text = text
  end

  def words
    separate_interpunction_from_words
    split_the_words
  end

  private

  def separate_interpunction_from_words
    SUPPORTED_INTERPUNCTION_SIGNS.each do |sign|
      @text.gsub!(sign, " #{sign}")
    end
  end

  def split_the_words
    @text.split(" ")
  end
end
