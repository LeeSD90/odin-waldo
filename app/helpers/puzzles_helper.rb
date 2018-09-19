module PuzzlesHelper
  def setup
    session[:remaining] = @puzzle.characters.map(&:name)
  end

  def update_remaining(char)
    session[:remaining].delete(char.downcase)
  end

  def complete?
    return session[:remaining].empty?
  end
end
