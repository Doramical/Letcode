//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/closest-divisors/

class Solution {
    func closestDivisors(_ num: Int) -> [Int] {
        let a = floor(sqrt(Double(num + 1)))
        let b = floor(sqrt(Double(num + 2)))
        if pow(a, 2) == Double(num + 1) {
            return [Int(a), Int(a)]
        }
        if pow(b, 2) == Double(num + 2) {
            return [Int(b), Int(b)]
        }

        let caculateDivisors = { (start: Int, end: Int) -> (a: Int, b: Int) in
            var m = 0
            var n = 0
            var flag = false
            for i in (1...start).reversed() where flag == false {
                if end % i == 0 {
                    m = i
                    n = end / i
                    flag = true
                }
            }
            return (m, n)
        }
        
        let result1 = caculateDivisors(Int(a), num + 1)
        let result2 = caculateDivisors(Int(b), num + 2)
        let flag = abs(result1.a - result1.b) < abs(result2.a - result2.b)
        return flag ? [result1.a, result1.b] : [result2.a, result2.b]
    }
}

Solution().closestDivisors(123)
