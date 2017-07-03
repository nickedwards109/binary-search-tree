class Tree
  attr_accessor :root

  # This method handles the very first insert.
  # If an insert has already happened, then the root attribute already exists,
  # and we call a recursive method that starts by comparing the root node score
  # with the new node score. This recursive method will either call itself later
  # with different node arguments or return the depth, based on the comparison
  # of the current node under consideration versus the new node.
  def insert(node_score, node_title)
    new_node = Node.new(node_score, node_title)
    if self.root.nil?
      self.root = new_node
      return 0
    else
    recursive_insert(self.root, new_node, 0)
    end
  end

  def recursive_insert(current_node, new_node, depth)
    depth += 1
    if new_node.score > current_node.score
      set_or_recurse_on_right_child(current_node, new_node, depth)
    elsif new_node.score < current_node.score
      set_or_recurse_on_left_child(current_node, new_node, depth)
    end
  end

  def set_or_recurse_on_right_child(current_node, new_node, depth)
    if current_node.right_child.nil?
      current_node.right_child = new_node
      return depth
    else
      recursive_insert(current_node.right_child, new_node, depth)
    end
  end

  def set_or_recurse_on_left_child(current_node, new_node, depth)
    if current_node.left_child.nil?
      current_node.left_child = new_node
      return depth
    else
      recursive_insert(current_node.left_child, new_node, depth)
    end
  end
end
