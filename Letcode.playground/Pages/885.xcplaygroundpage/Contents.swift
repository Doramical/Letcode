//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/spiral-matrix-iii/

enum Direction {
    case left, right, bottom, top
    
    var turn: Direction {
        switch self {
            case .right: return .bottom
            case .left: return .top
            case .top: return .right
            case .bottom: return .left
        }
    }
}

class Solution {
    func spiralMatrixIII(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        var result = [[Int]]()
        var count = R * C
        
        var leftIndex = r0
        var rightIndex = r0
        var topIndex = r0
        var bottomIndex = r0
        
        var rIndex = r0
        var cIndex = r0
        var direction = Direction.left
        
        while count > 0 {
            result.append([rIndex, cIndex])
            switch direction {
                case .left:
                cIndex += 1
                cIndex >= C ? C : cIndex
                cIndex <= 0 ? 0 : cIndex
                if cIndex > rightIndex {
                    direction = direction.turn
                }
                rightIndex += 1
                cIndex >= C ? C : cIndex
                cIndex >= C ? C : cIndex
                default: break
            }
            count -= 1
        }
        return result
    }
}
