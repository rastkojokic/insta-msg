module ChatHelper
  def dialect_display_name(dialect_value)
    if dialect_value == "pirate"
      "Pirate"
    elsif dialect_value == "yoda"
      "Yoda"
    elsif dialect_value == "valley_girl"
      "Valley Girl"
    end
  end
end
