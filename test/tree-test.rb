require 'minitest/autorun'
require './lib/tree'

class TreeTest < Minitest::Test
  def setup
    @tree = Tree.new
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_tree_inserts_nodes
    new_tree = Tree.new
    assert_equal(0, new_tree.insert(61, "Bill & Ted's Excellent Adventure"))
    assert_equal(1, new_tree.insert(16, "Johnny English"))
    assert_equal(1, new_tree.insert(92, "Sharknado 3"))
    assert_equal(2, new_tree.insert(50, "Hannibal Buress: Animal Furnace"))
  end

  def test_tree_includes_node
    assert @tree.include?(61)
    assert @tree.include?(16)
    assert @tree.include?(50)
    refute @tree.include?(42)
  end
end
