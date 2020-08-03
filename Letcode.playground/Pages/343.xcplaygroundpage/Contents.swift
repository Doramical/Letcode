//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

func integerBreak(_ n: Int) -> Int {
    guard n > 2 else {
        return 1
    }
    guard n > 3 else {
        return 2
    }
    var a = 1, _n = n
    while _n > 4 {
        _n -= 3
        a *= 3
    }
    return a * _n
}
