class Dialect::ValleyGirl < Dialect
  PHRASE = "like"

  def translate_message(message_text)
    message = Message.new(message_text)
    translated_message = ""

    message.words.each_with_index do |word, index|
      translated_message << " #{translate_word(word)}"

      translated_message << " #{PHRASE}" if index == random_word_position(message)
    end

    translated_message.strip
  end

  private

  def translate_word(word)
    word
  end

  def random_word_position(message)
    @random_word_position ||= rand(0..number_of_words(message))
  end

  def number_of_words(message)
    message.words.length - 1
  end
end
