require 'minitest/autorun'
require './lib/node'

class NodeTest < Minitest::Test
  def test_node_has_a_score_and_title_and_root_attribute
    node = Node.new(100, "The Land Before Time")
    assert_equal(100, node.score)
    assert_equal("The Land Before Time", node.title)
    assert_nil node.left_child
    assert_nil node.right_child
  end
end
