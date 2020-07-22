//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/super-pow/

class Solution {
    
    let mod = 1337
    
    func superPow(_ a: Int, _ b: [Int]) -> Int {
        guard !b.isEmpty else {
            return 1
        }
        var _b = b
        let last = _b.removeLast()
        let m = pow(a, last)
        let n = pow(superPow(a, _b), 10)
        return m * n % mod
    }
    
    func pow(_ a: Int, _ k: Int) -> Int {
        if k == 0 {
            return 1
        }
        let m = a % mod
        if k.isMultiple(of: 2) {
            return (pow(m, k / 2) * pow(m, k / 2)) % mod
        } else {
            return (m * pow(m, k - 1)) % mod
        }
    }
}

Solution().superPow(2, [1, 0])
