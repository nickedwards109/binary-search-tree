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

  # This method handles the first check to see if the tree includes a node
  # with a certain score. If there is no root node, this method returns false
  # without doing any recursion. Otherwise, it will call a recursive method that
  # starts by comparing the root node score with the passed in score.
  def include?(score)
    if self.root.nil?
      return false
    else
      recursive_include?(self.root, score)
    end
  end

  def recursive_include?(node, score)
    if score == node.score
      return true
    elsif score > node.score && !node.right_child.nil?
      recursive_include?(node.right_child, score)
    elsif score < node.score && !node.left_child.nil?
      recursive_include?(node.left_child, score)
    else
      return false
    end
  end

  # This method handles the first check to find the depth of a score.
  # If the root node has that score, this method returns 0 without doing any
  # recursion. Otherwise, it will compare the root node's score with the passed
  # in score, and then call a recursive method that starts by comparing one of
  # the root node's children with the passed in score.
  def depth_of(score)
    return 0 if self.root.score == score
    if score > self.root.score
      recursive_depth_of(self.root.right_child, score, 0)
    elsif score < self.root.score
      recursive_depth_of(self.root.left_child, score, 0)
    end
  end

  def recursive_depth_of(node, score, depth)
    depth += 1
    if node.nil?
      return nil
    elsif score == node.score
      return depth
    elsif score > node.score
      recursive_depth_of(node.right_child, score, depth)
    elsif score < node.score
      recursive_depth_of(node.left_child, score, depth)
    end
  end

  # This method handles the first check to find the node with the maximum score.
  # If the root node has no right_child node, then return the formatted title
  # and score of the root node. Otherwise, call a recursive method that checks
  # successive right children until it finds a node with no right child,
  # indicating the node with the maximum score.
  def max
    if self.root.right_child.nil?
      return {self.root.title => self.root.score}
    else
      recursive_max(self.root.right_child)
    end
  end

  def recursive_max(node)
    if node.right_child.nil?
      return {node.title => node.score}
    else
      recursive_max(node.right_child)
    end
  end

  def min
    if self.root.left_child.nil?
      return {self.root.title => self.root.score}
    else
      recursive_max(self.root.left_child)
    end
  end

  def recursive_max(node)
    if node.left_child.nil?
      return {node.title => node.score}
    else
      recursive_max(node.left_child)
    end
  end
end
