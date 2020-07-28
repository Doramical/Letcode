//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


// https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
func maxDepth(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
}

let tree = TreeNode(3)
tree.left = TreeNode(9)
tree.right = TreeNode(20)
tree.right?.left = TreeNode(15)
tree.right?.right = TreeNode(7)
maxDepth(tree)
