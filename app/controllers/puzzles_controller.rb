class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def check
    logger.debug params
    @puzzle = Puzzle.find(params[:id])
    correct = @puzzle.check(params[:character], params[:x], params[:y])
    render json:  correct
  end

end
