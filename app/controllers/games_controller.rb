class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(rand(1..15))
  end

  def score
  end
end
