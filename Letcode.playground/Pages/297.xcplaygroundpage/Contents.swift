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
       / \
      2   3
     /     \
    4       4
     
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
        // 队列中非空的节点
        var nodeCount = 1
        // 队列中游标索引
        var queueIndex = 0
        
        while queueIndex < queue.count {
            currentNode = queue[queueIndex]
            queueIndex += 1
            guard let node = currentNode else {
                if nodeCount > 0 {
                    result.append("*")
                }
                continue
            }
            
            result.append(String(node.val))
            
            let letfNode = currentNode?.left
            let rightNode = currentNode?.right
            var addEmptyLeftNode = false
            if letfNode == nil && nodeCount > 0 {
                addEmptyLeftNode.toggle()
                queue.append(nil)
            }
            if letfNode != nil {
                queue.append(letfNode)
                nodeCount += 1
            }
            if rightNode == nil && nodeCount > 0 {
                queue.append(nil)
            }
            if rightNode != nil {
                if letfNode == nil && !addEmptyLeftNode {
                    queue.append(nil)
                }
                queue.append(rightNode)
                nodeCount += 1
            }
            nodeCount -= 1
        }
        return result.joined(separator: " ")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty {
            return nil
        }
        var nodeDataArray = data.components(separatedBy: " ")
        if nodeDataArray.count <= 0 {
            return nil
        }
        let firstNodeData = nodeDataArray.removeFirst()
        guard firstNodeData != "*", let firstVal = Int(firstNodeData) else {
            return nil
        }
        
        let rootNode = TreeNode(firstVal)
        var queue = [TreeNode?]()
        queue.append(rootNode)
        
        var isLeft = true
        
        var nodeIndex = 0
        var queueIndex = 0
        
        while nodeIndex < nodeDataArray.count && queueIndex < queue.count {
            
            let parentNode = queue[queueIndex]
            queueIndex += 1
            
            // 左结点处理
            let nodeData = nodeDataArray[nodeIndex]
            nodeIndex += 1
            if nodeData != "*", let nodeVal = Int(nodeData) {
                let node = TreeNode(nodeVal)
                if isLeft {
                    parentNode?.left = node
                } else {
                    parentNode?.right = node
                }
                isLeft.toggle()
                queue.append(node)
            } else {
                if isLeft {
                    parentNode?.left = nil
                } else {
                    parentNode?.right = nil
                }
                isLeft.toggle()
            }
            
            // 检查是否还有下个
            if nodeIndex < nodeDataArray.count {
                let nextNodeData = nodeDataArray[nodeIndex]
                nodeIndex += 1
                if nextNodeData != "*", let nextVal = Int(nextNodeData) {
                    let nextNode = TreeNode(nextVal)
                    if isLeft {
                        parentNode?.left = nextNode
                    } else {
                        parentNode?.right = nextNode
                    }
                    isLeft.toggle()
                    queue.append(nextNode)
                } else {
                    if isLeft {
                        parentNode?.left = nil
                    } else {
                        parentNode?.right = nil
                    }
                    isLeft.toggle()
                }
            }
        }
        return rootNode
    }
}

var codec = Codec()

let exampleNode1 = TreeNode(1)
exampleNode1.left = TreeNode(2)
exampleNode1.right = TreeNode(3)
exampleNode1.left?.left = TreeNode(4)
exampleNode1.right?.right = TreeNode(4)

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
let node = codec.deserialize(codec.serialize(exampleNode1))
node?.left
node?.right
