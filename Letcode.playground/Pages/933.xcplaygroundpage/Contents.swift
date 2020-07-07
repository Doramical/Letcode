//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/number-of-recent-calls/


class RecentCounter {
    
    private var queue: [Int]
    private var startIndex: Int

    init() {
        queue = []
        startIndex = 0
    }
    
    func ping(_ t: Int) -> Int {
        queue.append(t)
        while t - queue[startIndex] > 3000 {
            startIndex += 1
        }
        return queue.count - startIndex
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */

let obj = RecentCounter()
obj.ping(1)
obj.ping(2)
obj.ping(3001)
obj.ping(3002)
obj.ping(4000)
