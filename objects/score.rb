# frozen_string_literal: true

# Representa um placar
class Score
  def initialize(score1, score2)
    @score = Text.new(new_score(score1, score2), x: PongConstants::SCORE_X, y: PongConstants::SCORE_Y)
  end

  attr_reader :score

  def opacity=(opacity)
    score.color.a = opacity
  end

  def change_score(new_score1, new_score2)
    score.text = new_score(new_score1, new_score2)
  end

  private

  def new_score(score1, score2)
    "#{new_pont(score1)}    #{new_pont(score2)}"
  end

  def new_pont(score)
    score < 10 ? "0#{score}" : score.to_s
  end
end
