# frozen_string_literal: true

require 'ruby2d'
require './utils/pong_constants'
require './objects/ball'
require './objects/player'
require './objects/pause'
require './objects/score'
require './utils/game_view'

# Alterando dados da tela
set title: PongConstants::TITLE,
    width: PongConstants::WIDTH,
    height: PongConstants::HEIGHT

on :key_down do |event|
  case event.key
  when 'space'
    GameView::PAUSE.change_pause_status!
  end
end

on :key_held do |event|
  next if GameView::PAUSE.is_paused

  case event.key
  when 'w'
    GameView::PLAYER1.speed.times do
      GameView::PLAYER1.move_up! if GameView::PLAYER1.player.y >= PongConstants::CAMP_LIMIT_Y1
    end
  when 's'
    GameView::PLAYER1.speed.times do
      GameView::PLAYER1.move_down! if GameView::PLAYER1.player.y4 <= PongConstants::CAMP_LIMIT_Y2
    end
  when 'o'
    GameView::PLAYER2.speed.times do
      GameView::PLAYER2.move_up! if GameView::PLAYER2.player.y >= PongConstants::CAMP_LIMIT_Y1
    end
  when 'l'
    GameView::PLAYER2.speed.times do
      GameView::PLAYER2.move_down! if GameView::PLAYER2.player.y4 <= PongConstants::CAMP_LIMIT_Y2
    end
  end
end

update do
  next if GameView::PAUSE.is_paused

  GameView::BALL.speed.times do
    if GameView::BALL.x_ball_limit <= PongConstants::CAMP_LIMIT_X1
      GameView::PLAYER2.score_a_point
      GameView::SCORE.change_score(GameView::PLAYER1.points, GameView::PLAYER2.points)
      GameView::BALL.position_ball!
      GameView::BALL.change_x_direction
      GameView::PAUSE.change_pause_status!
      break
    elsif GameView::BALL.x_ball_limit >= PongConstants::CAMP_LIMIT_X2
      GameView::PLAYER1.score_a_point
      GameView::SCORE.change_score(GameView::PLAYER1.points, GameView::PLAYER2.points)
      GameView::BALL.position_ball!
      GameView::BALL.change_x_direction
      GameView::PAUSE.change_pause_status!
      break
    end

    if GameView::PLAYER1.player.contains?(GameView::BALL.x_ball_limit,
                                          GameView::BALL.ball.y) || GameView::PLAYER2.player.contains?(GameView::BALL.x_ball_limit,
                                                                                                       GameView::BALL.ball.y)
      GameView::BALL.change_x_direction
    end

    if GameView::BALL.y_ball_limit <= PongConstants::CAMP_LIMIT_Y1 || GameView::BALL.y_ball_limit >= PongConstants::CAMP_LIMIT_Y2
      GameView::BALL.change_y_direction
    end

    GameView::BALL.move!
  end
end

show
