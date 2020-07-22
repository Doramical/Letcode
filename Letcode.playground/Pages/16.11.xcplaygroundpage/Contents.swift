//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Solution {
    func divingBoard(_ shorter: Int, _ longer: Int, _ k: Int) -> [Int] {
        guard k > 0 else {
            return []
        }
        let value = longer - shorter
        let minValue = shorter * k
        guard value > 0 else {
            return [minValue]
        }
        var result = [Int]()
        for i in 0...k {
            result.append(minValue + value * i)
        }
        return result
        
    }
}

Solution().divingBoard(2, 3, 8)
