//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/path-sum/

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

class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let val = root?.val else {
            return false
        }
        var isLeaf = false
        if root?.left == nil && root?.right == nil {
            isLeaf = true
        }
        if isLeaf {
            return val == sum
        }
        
        let nextSum = sum - val
        var result = false
        if let left = root?.left {
            result = hasPathSum(left, nextSum)
        }
        if let right = root?.right, result == false {
            result = hasPathSum(right, nextSum)
        }
        return result
    }
}

