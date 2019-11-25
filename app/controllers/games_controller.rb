require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(rand(9..15))
  end

  def score
    @score = params[:score]
    @letters = params[:letters]
    if !@score.chars.all? { |place| @letters.include?(place) }
      @answer = "Sorry but #{@score} can't be built out of #{@letters}"
    elsif !english_word?(@score)
      @answer = "Sorry but #{@score} doesn't seem to be a valid English word"
    else
      @answer = "Congratulations! #{@score} is a valid English word!"
    end
  end

  def english_word?(answer)
    response = open("https://wagon-dictionary.herokuapp.com/#{answer}")
    json = JSON.parse(response.read)
    json['found']
 end
end
