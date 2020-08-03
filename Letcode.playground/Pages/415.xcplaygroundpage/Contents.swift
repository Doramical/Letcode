//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/add-strings/
func addStrings(_ num1: String, _ num2: String) -> String {
    let count1 = num1.count
    let count2 = num2.count
    let count = max(count1, count2)
    var ans = ""
    var v1 = 0
    var v2 = 0
    var temp = 0
    for i in 1...count {
        if i <= count1 {
            let c1 = num1[num1.index(num1.startIndex, offsetBy:count1 - i)]
            if let a = c1.wholeNumberValue {
                v1 = a
            }
        }
        if i <= count2 {
            let c2 = num2[num2.index(num2.startIndex, offsetBy: count2 - i)]
            if let a = c2.wholeNumberValue {
                v2 = a
            }
        }
        let sum = v1 + v2 + temp
        if sum >= 10 {
            temp = sum / 10
            ans.insert(Character("\(sum % 10)"), at: ans.startIndex)
        } else {
            temp = 0
            ans.insert(Character("\(sum)"), at: ans.startIndex)
        }
        v1 = 0
        v2 = 0
    }
    if temp > 0 {
        ans.insert(Character("\(temp)"), at: ans.startIndex)
    }
    return ans
    
}

addStrings("9", "1")
123456 + 1234
