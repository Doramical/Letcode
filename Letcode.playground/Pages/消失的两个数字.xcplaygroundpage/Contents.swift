//: [Previous](@previous)

import Foundation


var str = "Hello, playground"

//: [Next](@next)

/**
 给定一个数组，包含从 1 到 N 所有的整数，但其中缺了两个数字。你能在 O(N) 时间内只用 O(1) 的空间找到它们吗？

 以任意顺序返回这两个数字均可。

 示例 1:

 输入: [1]
 输出: [2,3]
 示例 2:

 输入: [2,3]
 输出: [1,4]
 提示：

 nums.length <= 30000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/missing-two-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func missingTwo(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else {
            return [1, 2]
        }
        
        let n = nums.count + 2
        
        let sumOfN = n * (n + 1) / 2
        var sumOfArray = 0
        
        let sumOfSqrtOfN: CLong = n * (n + 1) * (2 * n + 1) / 6
        var sumOfSqrtOfArray: CLong = 0
        
        for num in nums {
            sumOfArray += num
            sumOfSqrtOfArray += (num * num)
        0}
        
        var a = 0, b = 0
        let sumOfab = sumOfN - sumOfArray
        let sumOfa2b2 = sumOfSqrtOfN - sumOfSqrtOfArray
        
        let value = floor(sqrt(Double(sumOfa2b2)))
        for i in 1...Int(value) {
            a = i
            if a * a == sumOfa2b2 {
                break
            } else {
                b = sumOfab - i
                if a * a + b * b == sumOfa2b2 {
                    break
                }
            }
        }
        
        if a == 0 && b == 0 {
            a = n - 1
            b = n
        } else if a != 0 && b == 0 {
            b = n
        }
        return [a, b]
    }
    
}

Solution().missingTwo([1, 2, 3, 6])
