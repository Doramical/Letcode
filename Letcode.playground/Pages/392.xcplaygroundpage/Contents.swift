//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/is-subsequence/

func isSubsequence(_ s: String, _ t: String) -> Bool {
    var offset = 0
    var iterator = t.makeIterator()
    while let char = iterator.next(), offset < s.count {
        let index = s.index(s.startIndex, offsetBy: offset)
        if s[index] == char {
            offset += 1
        }
    }
    return offset == s.count
}

isSubsequence("axc", "ahbgdc")
