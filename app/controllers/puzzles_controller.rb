class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    @scores = @puzzle.scores.all
    setup
  end

  def check
    logger.debug params
    @puzzle = Puzzle.find(params[:id])

    correct = @puzzle.check(params[:character], params[:x], params[:y])

    if correct
      update_remaining(params[:character])
    end

    correct = { correct: correct, name: params[:character] }

    if complete?
      correct[:complete] = true
      correct[:time] = Time.now - Time.parse(session[:time])
      render json: correct
    else
      render json:  correct
    end
  end

end
