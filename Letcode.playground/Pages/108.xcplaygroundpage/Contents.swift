//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/**
 将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。

 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。

 示例:

 给定有序数组: [-10,-3,0,5,9],

 一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：

       0
      / \
    -3   9
    /   /
  -10  5

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else {
            return nil
        }
        guard nums.count > 1 else {
            return TreeNode(nums[0])
        }
        
        let mid = nums.count / 2
        let root = TreeNode(nums[mid])
        let result = generateTreeNode(root, nums, 0..<mid, (mid + 1)..<nums.count)
        
        return result
    }
    
    
    func generateTreeNode(_ root: TreeNode?, _ nums: [Int], _ leftRange: Range<Int>, _ rightRange: Range<Int>) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if leftRange.lowerBound < leftRange.upperBound {
            let mid = leftRange.lowerBound + (leftRange.upperBound - leftRange.lowerBound) / 2
            let leftNode = TreeNode(nums[mid])
            let _leftRange = Range(uncheckedBounds: (lower: leftRange.lowerBound, upper: mid))
            let _rightRange = Range(uncheckedBounds: (lower: mid + 1, upper: leftRange.upperBound))
            root.left = generateTreeNode(leftNode, nums, _leftRange, _rightRange)
        }
        
        if rightRange.lowerBound < rightRange.upperBound {
            let mid = rightRange.lowerBound + (rightRange.upperBound - rightRange.lowerBound) / 2
            let rightNode = TreeNode(nums[mid])
            let _leftRange = Range(uncheckedBounds: (lower: rightRange.lowerBound, upper: mid))
            let _rightRange = Range(uncheckedBounds: (lower: mid + 1, upper: rightRange.upperBound))
            root.right = generateTreeNode(rightNode, nums, _leftRange, _rightRange)
        }
        
        return root
    }
}

let node = Solution().sortedArrayToBST([-10,-3,0,5,9])
node?.left
node?.left?.left
node?.right
node?.right?.left
