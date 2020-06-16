import UIKit
import Foundation

/*
你可以将以下二叉树：

    1
   / \
  2   3
     / \
    4   5

"[1,2,3,null,null,4,5]"
 
    1
     \
      2
     /
    3
 
序列化为 "[1, null, 2, 3]"

       5
      / \
     4   7
    /   /
   3   2
  /   /
 -1  9
 
序列化为 "[5, 4, 7, 3, null, 2, null, -1, null, 9]"
 
 
来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree
 */

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

extension TreeNode {
    var hasChild: Bool {
        return left != nil && right != nil
    }
}

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {
            return "*"
        }
        var result = [String]()
        var queue = [TreeNode?]()
        queue.append(root)
        var currentNode: TreeNode?
        while queue.count > 0 {
            currentNode = queue.removeFirst()
            guard let node = currentNode else {
                if queue.compactMap({ $0 }).count > 0 {
                    result.append("*")
                }
                continue
            }
            result.append(String(node.val))
            
            let letfNode = currentNode?.left
            let rightNode = currentNode?.right
            if letfNode == nil && queue.compactMap({ $0 }).count > 0 {
                queue.append(nil)
            }
            if letfNode != nil {
                queue.append(letfNode)
            }
            if rightNode == nil && queue.compactMap({ $0 }).count > 0 {
                queue.append(nil)
            }
            if rightNode != nil {
                if letfNode == nil {
                    queue.append(nil)
                }
                queue.append(rightNode)
            }
        }
        return result.joined(separator: " ")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty {
            return nil
        }
        var nodeArr = data.components(separatedBy: " ")
        if nodeArr.count <= 0 {
            return nil
        }
        let firstNode = nodeArr.removeFirst()
        guard firstNode != "*", let val = Int(firstNode) else {
            return nil
        }
        let resultNode = TreeNode(val)
        var currentNode: TreeNode?
        currentNode = TreeNode(val)
        while nodeArr.count > 0 {
            let node = nodeArr.removeFirst()
            guard node != "*", let val = Int(node) else {
                resultNode.left = nil
                currentNode = nil
                continue
            }
            resultNode.left = TreeNode(val)
            currentNode = TreeNode(val)
        }
        return resultNode
    }
}

var codec = Codec()

let exampleNode1 = TreeNode(1)
exampleNode1.left = TreeNode(2)
exampleNode1.right = TreeNode(3)
exampleNode1.right?.left = TreeNode(4)
exampleNode1.right?.right = TreeNode(5)

let exampleNode2 = TreeNode(1)
exampleNode2.right = TreeNode(2)
exampleNode2.right?.left = TreeNode(3)

let exampleNode3 = TreeNode(5)
exampleNode3.left = TreeNode(4)
exampleNode3.right = TreeNode(7)
exampleNode3.left?.left = TreeNode(3)
exampleNode3.left?.left?.left = TreeNode(-1)
exampleNode3.right?.left = TreeNode(2)
exampleNode3.right?.left?.left = TreeNode(9)

codec.serialize(exampleNode1)
codec.serialize(exampleNode2)
codec.serialize(exampleNode3)
