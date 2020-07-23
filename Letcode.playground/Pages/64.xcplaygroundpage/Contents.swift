//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// https://leetcode-cn.com/problems/minimum-path-sum/

func minPathSum(_ grid: [[Int]]) -> Int {
    guard !grid.isEmpty else {
        return 0
    }
    
    var _grid = grid
    let m = _grid.count
    let n = _grid[0].count
    
    for i in 0..<m {
        for j in 0..<n where j > 0 || i > 0 {
            switch (i, j) {
                case (0,     1..<n): _grid[i][j] += _grid[i][j - 1]
                case (1..<m,     0): _grid[i][j] += _grid[i - 1][j]
                default: _grid[i][j] += min(_grid[i - 1][j], _grid[i][j - 1])
            }
        }
    }
    return _grid[m - 1][n - 1]
}


minPathSum([[1]])
