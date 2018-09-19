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
    render json:  correct
  end

end
