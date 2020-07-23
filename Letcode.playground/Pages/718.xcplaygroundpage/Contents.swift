//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/**
 给两个整数数组 A 和 B ，返回两个数组中公共的、长度最长的子数组的长度。

 示例 1:

 输入:
 A: [1,2,3,2,1]
 B: [3,2,1,4,7]
 输出: 3
 解释:
 长度最长的公共子数组是 [3, 2, 1]。
 说明:

 1 <= len(A), len(B) <= 1000
 0 <= A[i], B[i] < 100

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-length-of-repeated-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        
        let m = A.count
        let n = B.count
        let minLen = min(m, n)
        
        var result = 0
        
        for i in 0..<minLen {
            let index_a = m - i - 1
            let index_b = 0
            let value = maxLengthOfSubarray(A, B, index_a, index_b)
            result = max(value, result)
            let value1 = maxLengthOfSubarray(B, A, index_a, index_b)
            result = max(value1, result)
        }
        return result
    }
    
    func maxLengthOfSubarray(_ A: [Int], _ B: [Int], _ index_a: Int, _ index_b: Int) -> Int {
        let minLen = min(A.count, B.count)
        var length = 0
        var value = 0
        var temp = 0
        for i in index_a..<minLen  {
            if A[i] == B[index_b + temp] {
                value += 1
            } else {
                value = 0
            }
            temp += 1
            length = max(length, value)
        }
        return length
    }
}

Solution().findLength([1,2,3,4,5], [1,1,2,3,4,4,5])
