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

typealias Point = (x: Double, y: Double)

class Solution {
    func numPoints(_ points: [[Int]], _ r: Int) -> Int {
        
        let count = points.count
        guard count > 1 else {
            return 1
        }
        
        // 是否包含在⭕️内
        let containPoint = { (center: Point, point: Point) -> ComparisonResult in
            let distance = (center.x - point.x) * (center.x - point.x) + (center.y - point.y) * (center.y - point.y)
            let value = Double(r * r)
            if distance < value {
                return .orderedAscending
            } else if distance == value {
                return .orderedSame
            } else {
                return .orderedDescending
            }
        }
        
        // 两点定⭕️
        let caculateCircleCenter = { (a: Point, b: Point) -> [Point] in
            
            // a、b的中心点
            let middle = (x: (a.x + b.x) / 2, y: (a.y + b.y) / 2)
            // a、b的距离
            let distanceOfa2b = sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y))
            if distanceOfa2b / 2 > Double(r) {
                return []
            }
            if distanceOfa2b == Double(r) {
                return [middle]
            }
            
            // 中心点在圆点的距离，根据勾股定算出
            let distanceOfm2c = sqrt(Double(r * r) - (distanceOfa2b / 2) * (distanceOfa2b / 2))
            // 根据相似三角形求出中心点 Xc - Xm，Yc - Ym 的距离
            let Xm = middle.x
            let Ym = middle.y
            let v1 = b.x - a.x
            let v2 = a.y - b.y
            let Xc1 = Xm + v2 * (distanceOfm2c / distanceOfa2b)
            let Yc1 = Ym + v1 * (distanceOfm2c / distanceOfa2b)
            let Xc2 = Xm - v2 * (distanceOfm2c / distanceOfa2b)
            let Yc2 = Ym - v1 * (distanceOfm2c / distanceOfa2b)
            
            return [(x: Xc1, y: Yc1), (x: Xc2, y: Yc2)]
        }
        var maxNum = 1
        var dic = [String: Set<Int>]()
        
        for i in 0..<count {
            let a = points[i].point
            for j in (i + 1)..<count {
                let b = points[j].point
                for center in caculateCircleCenter(a, b) {
                    let key = "(x: \(center.x), y:\(center.y))"
                    var values = dic[key] ?? []
                    
                    var containPointNum = 0
                    for k in 0..<count where !values.contains(k) {
                        if k == i || k == j {
                            containPointNum += 1
                            continue
                        }
                        let c = points[k].point
                        let result = containPoint(center, c)
                        if result == .orderedAscending {
                            containPointNum += 1
                        } else if result == .orderedSame {
                            containPointNum += 1
                            // 记录刚好在圆周上的点，下次不生成该圆
                            values.insert(i)
                            values.insert(j)
                            values.insert(k)
                            dic[key] = values
                        }
                    }
                    maxNum = max(containPointNum, maxNum)
                }
            }
        }
        return maxNum
    }
}

extension Array where Element == Int {
    var point: Point {
        return (Double(self[0]), Double(self[1]))
    }
}


let result = Solution().numPoints([[-2,0],[2,0],[0,2],[0,-2]], 2)
