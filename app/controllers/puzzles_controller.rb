class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    @scores = @puzzle.scores.order(time: :asc).first(10)
    setup
  end

  def add_score
    @puzzle = Puzzle.find(params[:id])
    name = params[:score][:name].blank? ? "Unknown" : params[:score][:name]
    @puzzle.scores.create(:name => name, :time => session[:high_score])
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
      lowest_highscore = @puzzle.scores.order(time: :asc).last
      if correct[:time] < lowest_highscore.time
        session[:high_score] = correct[:time]
      end
    end
    render json: correct
  end

end
