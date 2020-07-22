//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/triangle/

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = triangle
        for i in (0..<dp.count - 1).reversed() {
            for j in 0 ..< triangle[i].count {
                dp[i][j] += min(dp[i+1][j], dp[i+1][j+1])
            }
        }
        return dp[0][0]
    }
}

Solution().minimumTotal([
     [2],
    [3,4],
   [6,5,1],
  [4,1,8,1],
 [1,2,3,4,1]
])
