# frozen_string_literal: true

require './utils/pong_constants'

# Representa um jogador
class Player
  def initialize(x_position)
    @points = 0

    @player = Rectangle.new(x: x_position,
                            y: PongConstants::PLAYER_POSITION_Y,
                            height: PongConstants::PLAYER_HEIGHT,
                            width: PongConstants::PLAYER_WIDTH)

    @speed = PongConstants::PLAYER_SPEED
  end

  attr_reader :player, :speed, :points

  def move_up!
    player.y = player.y - 1
  end

  def move_down!
    player.y = player.y + 1
  end

  def score_a_point
    self.points += 1
  end

  def opacity=(opacity)
    player.color.a = opacity
  end

  private

  attr_writer :points
end
