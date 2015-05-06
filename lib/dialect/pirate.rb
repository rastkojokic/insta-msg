class Dialect::Pirate < Dialect
  DICTIONARY_PATH = "/config/pirate_dictionary.yml"

  def translate_message(message_text)
    message = Message.new(message_text)
    translated_message = ""

    message.words.each do |word|
      translated_message << " #{translate_word(word)}"
    end

    translated_message.strip.capitalize
  end

  private

  def translate_word(word)
    load_dictionary

    if @dictionary[word.downcase].present?
      @dictionary[word.downcase]
    else
      word
    end
  end

  def load_dictionary
    @dictionary ||= YAML.load_file("#{Rails.root.to_s}#{DICTIONARY_PATH}")
  end
end
