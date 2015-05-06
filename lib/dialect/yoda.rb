class Dialect::Yoda < Dialect
  def translate_message(message_text)
    message = Message.new(message_text)

    message.words.shuffle.join(" ")
  end
end
