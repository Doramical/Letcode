//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// https://leetcode-cn.com/problems/last-stone-weight/
class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        guard !stones.isEmpty else {
            return 0
        }
        guard stones.count > 1 else {
            return stones[0]
        }
        var _stones = stones.sorted()
        while _stones.count >= 2 {
            let a = _stones.removeLast()
            let b = _stones.removeLast()
            if a > b {
                _stones.append(a - b)
                _stones.sort()
            }
        }
        
        guard !_stones.isEmpty else {
            return 0
        }
        
        return _stones[0]
    }
}

Solution().lastStoneWeight([2,7,4,1,8,1])
