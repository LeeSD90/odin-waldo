class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    @scores = @puzzle.scores.order(time: :asc).first(10)
    setup
  end

  def check
    @puzzle = Puzzle.find(params[:id])

    correct = @puzzle.check(params[:character], params[:x], params[:y])

    if correct
      update_remaining(params[:character])
    end

    correct = { correct: correct, name: params[:character] }

    if complete?
      correct[:complete] = true
      correct[:time] = Time.now - Time.parse(session[:time])
      score = @puzzle.scores.order(time: :asc).last
      if correct[:time] < score.time
        name = params[:name].blank? ? "Unknown" : params[:name]
        @puzzle.scores.create(:name => name, :time => correct[:time])
      end
      render json: correct
    else
      render json:  correct
    end
  end

end
