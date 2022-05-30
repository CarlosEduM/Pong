# frozen_string_literal: true

# Representa uma bola no jogo
class Ball
  def initialize
    @ball = Circle.new(radius: PongConstants::BALL_RADIUS)
    position_ball!

    @speed = PongConstants::BALL_SPEED
    @speed_x = rand_speed
    @speed_y = rand_speed
  end

  attr_reader :speed, :ball

  def position_ball!
    ball.x = PongConstants::BALL_POSITION_X
    ball.y = rand(PongConstants::BALL_POSITION_Y)
  end

  def change_x_direction
    self.speed_x *= -1
  end

  def change_y_direction
    self.speed_y *= -1
  end

  def move!
    ball.x = speed_x + ball.x
    ball.y = speed_y + ball.y
  end

  def x_ball_limit
    ball.radius * speed_x + ball.x
  end

  def y_ball_limit
    ball.radius * speed_y + ball.y
  end

  def opacity=(opacity)
    ball.color.a = opacity
  end

  private

  attr_accessor :speed_x, :speed_y

  def rand_speed
    rand(0..1) == 1 ? 1 : -1
  end
end
