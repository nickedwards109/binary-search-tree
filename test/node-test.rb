require 'minitest/autorun'

class NodeTest < Minitest::Test
  def test_node_has_a_score_and_a_title
    node = Node.new
    assert_respond_to(node, :score)
    assert_respond_to(node, :title)
  end
end
