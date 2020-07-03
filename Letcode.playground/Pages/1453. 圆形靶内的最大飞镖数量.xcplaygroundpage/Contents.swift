//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/**
 墙壁上挂着一个圆形的飞镖靶。现在请你蒙着眼睛向靶上投掷飞镖。

 投掷到墙上的飞镖用二维平面上的点坐标数组表示。飞镖靶的半径为 r 。

 请返回能够落在 任意 半径为 r 的圆形靶内或靶上的最大飞镖数。

  

 示例 1：



 输入：points = [[-2,0],[2,0],[0,2],[0,-2]], r = 2
 输出：4
 解释：如果圆形的飞镖靶的圆心为 (0,0) ，半径为 2 ，所有的飞镖都落在靶上，此时落在靶上的飞镖数最大，值为 4 。
 示例 2：



 输入：points = [[-3,0],[3,0],[2,6],[5,4],[0,9],[7,8]], r = 5
 输出：5
 解释：如果圆形的飞镖靶的圆心为 (0,4) ，半径为 5 ，则除了 (7,8) 之外的飞镖都落在靶上，此时落在靶上的飞镖数最大，值为 5 。
 示例 3：

 输入：points = [[-2,0],[2,0],[0,2],[0,-2]], r = 1
 输出：1
 示例 4：

 输入：points = [[1,2],[3,5],[1,-1],[2,3],[4,1],[1,3]], r = 2
 输出：4
  

 提示：

 1 <= points.length <= 100
 points[i].length == 2
 -10^4 <= points[i][0], points[i][1] <= 10^4
 1 <= r <= 5000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-number-of-darts-inside-of-a-circular-dartboard
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

typealias Point = (x: Int, y: Int)

class Solution {
    func numPoints(_ points: [[Int]], _ r: Int) -> Int {
        /**
         想要更多的点落在靶内，则需要以两个点刚好在圆上，穷举法
         */
        
        guard !points.isEmpty else {
            return 0
        }
        
        guard points.count > 1 else {
            return 1
        }
        
        // 是否包含在⭕️内
        let containPoint = { (center: Point, point: Point) -> Bool in
            (pow(Decimal(abs(center.x - point.x)), 2) +
                pow(Decimal(abs(center.y - point.y)), 2)) <= pow(Decimal(r), 2)
        }
        
        // 三点定⭕️
        let hasCircleCenter = { (a: Point, b: Point, c: Point) -> Point? in
            var minX = min((a.x + b.x) / 2, (a.x + c.x) / 2, (b.x + c.x) / 2)
            let maxX = max((a.x + b.x) / 2, (a.x + c.x) / 2, (b.x + c.x) / 2)
            var minY = min((a.y + b.y) / 2, (a.y + c.y) / 2, (b.y + c.y) / 2)
            let maxY = max((a.y + b.y) / 2, (a.y + c.y) / 2, (b.y + c.y) / 2)
            
            var result: Point?
            while minX < maxX {
                guard result == nil else {
                    break
                }
                let temp = minY
                while minY < maxY {
                    if (pow(Decimal(abs(a.x - minX)), 2) +
                        pow(Decimal(abs(a.y - minY)), 2)) <= pow(Decimal(r), 2) &&
                        (pow(Decimal(abs(b.x - minX)), 2) +
                        pow(Decimal(abs(b.y - minY)), 2)) <= pow(Decimal(r), 2) {
                        result = (x: minX, y: minY)
                        break
                    }
                    minY += 1
                }
                minX += 1
                minY = temp
            }
            return result
        }
        
        guard points.count > 2 else {
            let center = hasCircleCenter(points[0].point, points[1].point, points[1].point)
            return (center != nil) ? 2 : 1
        }
        
        var firstIndex = 0
        var secondIndex = 1
        var thirdIndex = 2
        
        if points.count == 3 {
            thirdIndex = 1
        }
        
        var maxPoint = 0
        while firstIndex < points.count  {
            
            if firstIndex == secondIndex || firstIndex == thirdIndex {
                firstIndex += 1
                continue
            }
            let _center = hasCircleCenter(points[firstIndex].point,
                                         points[secondIndex].point,
                                         points[thirdIndex].point)
            guard let center = _center else {
                firstIndex += 1
                continue
            }
            maxPoint = 3
            if secondIndex == thirdIndex {
                maxPoint -= 1
            }

            // 确定圆点之后开始枚举有多少个点在⭕️内
            for (index, val) in points.enumerated() {
                guard ![firstIndex, secondIndex, thirdIndex].contains(index) else {
                    continue
                }
                if containPoint(center, val.point) {
                    maxPoint += 1
                }
            }
            
            firstIndex += 1
        }
        return maxPoint
    }
}

extension Array where Element == Int {
    var point: Point {
        return (self[0], self[1])
    }
}


let result = Solution().numPoints([[-2,0],[2,0],[0,1],[-3, 0],[0,2],[0,-2]], 2)
print(result)
