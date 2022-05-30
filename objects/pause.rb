# frozen_string_literal: true

# pause
class Pause
  def initialize(*pauseable)
    @is_paused = true
    @paused_text = Text.new(PongConstants::PAUSE_TEXT, x: PongConstants::PAUSE_X, y: PongConstants::PAUSE_Y)

    @pauseable = []
    pauseable.each do |obj|
      if obj.respond_to? :opacity=
        obj.opacity = PongConstants::PAUSE_OPACITY
        @pauseable << obj
      end
    end
  end

  attr_reader :is_paused, :paused_text, :pauseable

  def change_pause_status!
    self.is_paused = !is_paused

    if is_paused
      paused_text.color.a = 1

      change_opacity(PongConstants::PAUSE_OPACITY)
    else
      paused_text.color.a = 0

      change_opacity(PongConstants::UNPAUSE_OPACITY)
    end
  end

  private

  attr_writer :is_paused

  def change_opacity(new_opacity)
    pauseable.each do |obj|
      obj.opacity = new_opacity
    end
  end
end
