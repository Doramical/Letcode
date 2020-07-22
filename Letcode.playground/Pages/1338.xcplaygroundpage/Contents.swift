//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/reduce-array-size-to-the-half/

class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        let halfSize = arr.count / 2
        var set = [Int: Int]()
        for i in 0..<halfSize {
            let a = arr[i]
            let m = set[a] ?? 0
            set[a] = m + 1
            if m + 1 >= halfSize {
                return 1
            }
            let b = arr[halfSize + i]
            let n = set[b] ?? 0
            set[b] = n + 1
            if n + 1 >= halfSize {
                return 1
            }
        }
        var size = 0
        var result = 0
        for val in set.values.sorted().reversed() where size < halfSize {
            size += val
            result += 1
        }
        return result
    }
}


Solution().minSetSize([1000,1000,1000,3,7])
