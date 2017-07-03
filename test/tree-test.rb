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

  def test_tree_includes_a_node
    assert @tree.include?(61)
    assert @tree.include?(16)
    assert @tree.include?(50)
    refute @tree.include?(42)

    blank_tree = Tree.new
    refute blank_tree.include?(1)
  end

  def test_tree_returns_depth_of_a_node
    assert_equal(1, @tree.depth_of(92))
    assert_equal(2, @tree.depth_of(50))
  end
end
