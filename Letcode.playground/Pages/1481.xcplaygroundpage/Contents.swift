//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/least-number-of-unique-integers-after-k-removals/

func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
    var map = [Int: Int]()
    for num in arr {
        map[num] = (map[num] ?? 0) + 1
    }
    var result = map.count
    var m = k
    for count in map.values.sorted() where m > 0 && count <= m {
        result -= 1
        m -= count
    }
    return result
}

findLeastNumOfUniqueInts([5,5,4], 1)
