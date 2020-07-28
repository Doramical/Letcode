//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


func isPalindrome(_ s: String) -> Bool {
    let filterStr = s.trimmingCharacters(in: .whitespaces).filter{ $0.isNumber || $0.isLetter }.lowercased()
    return filterStr.reversed().elementsEqual(filterStr)
}

isPalindrome("A man, a plan, a canal: Panama")
