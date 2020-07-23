//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/**
 给定一个 n x n 矩阵，其中每行和每列元素均按升序排序，找到矩阵中第 k 小的元素。
 请注意，它是排序后的第 k 小元素，而不是第 k 个不同的元素。

  

 示例：

 matrix = [
    [   1,  5,    9,  10],
    [10, 11, 13,   14],
    [12, 13, 15,   26],
    [16, 18, 19,   27],
 ],
 k = 8,

 返回 13。
  

 提示：
 你可以假设 k 的值永远是有效的，1 ≤ k ≤ n2 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/kth-smallest-element-in-a-sorted-matrix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        if k == 1 {
            return matrix[0][0]
        }
        return matrix.flatMap({ $0 }).sorted()[k - 1]
    }
    
    // 二分法查找
    func kthSmallestOfBinarySearch(_ matrix: [[Int]], _ k: Int) -> Int {
        
        if k == 1 {
            return matrix[0][0]
        }
        
        let n = matrix.count
        var left = matrix[0][0]
        var right = matrix[n - 1][n - 1]
        
        let check = { (mid: Int) -> Bool in
            var num = 0
            var i = n - 1
            var j = 0
            while i >= 0 && j < n {
                if matrix[i][j] <= mid {
                    num += (i + 1)
                    j += 1
                } else {
                    i -= 1
                }
            }
            return num >= k
        }
        while left < right {
            let mid = left + (right - left) / 2
            if check(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}

Solution().kthSmallest([[1,5,9],[10,11,13],[12,13,15]], 4)
Solution().kthSmallestOfBinarySearch([[1,5,9],[10,11,13],[12,13,15]], 4)
