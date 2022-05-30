# frozen_string_literal: true

# representa um campo de pong
module GameView
  LINES = [Line.new(color: PongConstants::CAMP_LINES_COLOR,
                    x1: PongConstants::CAMP_LIMIT_X1,
                    x2: PongConstants::CAMP_LIMIT_X2,
                    y1: PongConstants::CAMP_LIMIT_Y1,
                    y2: PongConstants::CAMP_LIMIT_Y1),
           Line.new(color: PongConstants::CAMP_LINES_COLOR,
                    x1: PongConstants::CAMP_LIMIT_X1,
                    x2: PongConstants::CAMP_LIMIT_X2,
                    y1: PongConstants::CAMP_LIMIT_Y2,
                    y2: PongConstants::CAMP_LIMIT_Y2),
           Line.new(color: PongConstants::CAMP_LINES_COLOR,
                    x1: PongConstants::CAMP_LIMIT_X1,
                    x2: PongConstants::CAMP_LIMIT_X1,
                    y1: PongConstants::CAMP_LIMIT_Y1,
                    y2: PongConstants::CAMP_LIMIT_Y2),
           Line.new(color: PongConstants::CAMP_LINES_COLOR,
                    x1: PongConstants::CAMP_LIMIT_X2,
                    x2: PongConstants::CAMP_LIMIT_X2,
                    y1: PongConstants::CAMP_LIMIT_Y1,
                    y2: PongConstants::CAMP_LIMIT_Y2)].freeze

  MID_LINE = Line.new(color: PongConstants::CAMP_LINES_COLOR,
                      x1: PongConstants::CAMP_MID_LINE_X,
                      x2: PongConstants::CAMP_MID_LINE_X,
                      y1: PongConstants::CAMP_LIMIT_Y1,
                      y2: PongConstants::CAMP_LIMIT_Y2)

  BALL = Ball.new

  PLAYER1 = Player.new(PongConstants::PLAYER1_POSITION_X)
  PLAYER2 = Player.new(PongConstants::PLAYER2_POSITION_X)

  SCORE = Score.new(PLAYER1.points, PLAYER2.points)

  PAUSE = Pause.new(BALL, PLAYER1, PLAYER2, SCORE)
end
