//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/contains-duplicate/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count == nums.count
    }
}
