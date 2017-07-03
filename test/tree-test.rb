require 'minitest/autorun'
require './lib/tree'

class TreeTest < Minitest::Test
  def test_tree_inserts_nodes
    tree = Tree.new
    assert_equal(0, tree.insert(61, "Bill & Ted's Excellent Adventure"))
    assert_equal(1, tree.insert(16, "Johnny English"))
    assert_equal(1, tree.insert(92, "Sharknado 3"))
    assert_equal(2, tree.insert(50, "Hannibal Buress: Animal Furnace"))
  end
end
