require 'longest_word'

class GamesController < ApplicationController
  def game
  	@grid = generate_grid(20)
  	@start_timer = Time.now
  end

  def score
  	session[:test] = params[:test]
  	
  	session[:count_games] = 0 if session[:count_games].nil?
  	session[:count_games] += 1

  	session[:high_scores] = [] if session[:high_scores].nil?

  	@attempt = params[:attempt]
  	@end_timer = Time.now
  	# run_game(attempt, grid, start_time, end_time)
  	# grid - Array
  	# start_time, end_time - Date
  	@results = run_game(@attempt, params[:grid_variable].split(''), params[:timer_start].to_datetime, @end_timer)
  	

  	session[:high_scores] << @results[:score].round

  end
end
