//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof/

class Solution {
    func minArray(_ numbers: [Int]) -> Int {
        var l = 0, r = numbers.count - 1
        while l < r {
            let mid = ((r - l) >> 1) + l
            if numbers[r] > numbers[mid] {
                r = mid
            } else if (numbers[r] < numbers[mid]) {
                l = mid + 1
            } else {
                r -= 1
            }
        }
        return numbers[l]
    }
}

Solution().minArray([1,3])
