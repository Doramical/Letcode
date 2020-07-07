//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/unique-paths-ii/


class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.isEmpty {
            return 0
        }
        
        let emptyArray = Array(repeating: 0, count: obstacleGrid[0].count)
        var resultMap = Array(repeating: emptyArray, count: obstacleGrid.count)
        
        let m = obstacleGrid.count - 1
        let n = obstacleGrid[0].count - 1
        
        if obstacleGrid[0][0] == 1 {
            return 0
        }
        
        for i in 0...m {
            for j in 0...n where obstacleGrid[i][j] == 0 {
                if i > 0 && j > 0 {
                    resultMap[i][j] = resultMap[i - 1][j] + resultMap[i][j - 1]
                } else if i > 0 && j == 0 {
                    resultMap[i][j] = resultMap[i - 1][j]
                } else if j > 0 && i == 0 {
                    resultMap[i][j] = resultMap[i][j - 1]
                } else {
                    resultMap[i][j] = 1
                }
            }
        }
        return resultMap[m][n]
    }
}

Solution().uniquePathsWithObstacles([[0,0],[0,0]])
