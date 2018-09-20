class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
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
      render json: correct
    else
      render json:  correct
    end
  end

end
