module DialectFactory
  def create_dialect(dialect_name)
    if dialect_name == "pirate"
      Dialect::Pirate.new
    elsif dialect_name == "valley_girl"
      Dialect::ValleyGirl.new
    elsif dialect_name == "yoda"
      Dialect::Yoda.new
    end
  end
end
