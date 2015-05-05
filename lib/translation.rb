class Translation
  include DialectFactory

  def initialize(dialect, message)
    @dialect = create_dialect(dialect)
    @message = message
  end

  def translate
    @dialect.translate_message(@message)
  end
end
