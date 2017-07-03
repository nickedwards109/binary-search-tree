class Node
  attr_accessor :score, :title, :left_child, :right_child

  def initialize(score, title)
    @score = score
    @title = title
    @left_child = nil
    @right_child = nil
  end
end
