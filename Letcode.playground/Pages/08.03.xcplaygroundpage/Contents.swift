//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

func findMagicIndex(_ nums: [Int]) -> Int {
    for var i in 0..<nums.count {
        if nums[i] == i {
            return i
        } else if nums[i] > i {
            i = nums[i]
        }
    }
    return -1
}
