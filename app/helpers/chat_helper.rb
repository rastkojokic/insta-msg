module ChatHelper
  def dialect_display_name(dialect_value)
    if dialect_value == "pirate"
      "pirate"
    elsif dialect_value == "yoda"
      "yoda"
    elsif dialect_value == "valley_girl"
      "valley Girl"
    end
  end
end
