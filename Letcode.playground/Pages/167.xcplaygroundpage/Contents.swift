//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard !numbers.isEmpty else {
            return []
        }
        
        guard numbers.count > 1 else {
            return numbers[0] == target ? [1] : []
        }
        
        var index1 = 0
        var index2 = numbers.count - 1
        var found = false
        while index1 < index2 && !found {
            let sum = numbers[index1] + numbers[index2]
            if sum < target {
                index1 += 1
            } else if sum > target {
                index2 -= 1
            } else {
                found = true
            }
        }
        return found ? [index1 + 1, index2 + 1] : []
    }
}

Solution().twoSum([2, 5, 7, 9], 9)
