//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

func two_dimension_array_interval_sum(_ nums: [[Int]], _ queries: [[Int]]) -> [Int] {
    guard !nums.isEmpty else {
        return []
    }
    var dp = nums
    let lines = nums.count
    let column = nums[0].count
    for i in 0..<lines {
        for j in 1..<column {
            dp[i][j] = dp[i][j - 1] + dp[i][j]
        }
    }
    dp
    
    var result = [Int]()
    for query in queries {
        let x1 = max(query[0], 0)
        let y1 = max(query[1], 0)
        let x2 = min(query[2], lines - 1)
        let y2 = min(query[3], column - 1)
        print(x1, y1, x2, y2)
        var value = 0
        for x in x1...x2 {
            value += (dp[x][y2] - (y1 > 0 ? dp[x][y1 - 1] : 0))
        }
        result.append(value)
    }
    return result
}

two_dimension_array_interval_sum(
    [[1,3,1,2,1],
     [1,3,1,2,1],
     [1,3,1,2,1]],
    [[0,0,2,2],[1,1,2,2]])
