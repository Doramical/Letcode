//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// https://leetcode-cn.com/problems/re-space-lcci/

/**
 0 <= len(sentence) <= 1000
 dictionary中总字符数不超过 150000。
 你可以认为dictionary和sentence中只包含小写字母。
 */
class Solution {
    func respace(_ dictionary: [String], _ sentence: String) -> Int {
        guard !sentence.isEmpty else {
            return 0
        }
        guard !dictionary.isEmpty else {
            return sentence.count
        }
        var _sentence = sentence
        for word in Set(dictionary).sorted(by: { $0.count > $1.count }) {
            _sentence = _sentence.replacingOccurrences(of: word, with: ".")
        }
        return _sentence.filter { $0 != "." }.count
    }
}

Solution().respace(["bt","vbtbvtvvbbvtbvvbbbvbtbbv","bvvbbbvvvbvttbtbvtvtvvbttbbbtvvvb","btttbvbbbtbbtbvvttbvbvtvbtbbttb","bt","vvbvbvbvtbvbvvvvtv","tbvvvtttvtbvbtttvvbtvvvvtvvbvvtvvbbvbbbvb","v","bvb","vvtbvtvbttbttvvbvttbt","btbtbtttvbbtbttbtvvttbvtbtvtbvvtbbbb","bttbvbbttvvbtvvvvb","bvvbvbvttbvtbvvtbttvvvvtvbtvbttbbvvtvtvv","vbtttt","btbvbbbvbtvtbvvv","b","tbtbtv","vbvbbvvbvbbvvb","vbvvtvbvbvbttvbvbtvbtbtvtbvbbtb","bvvbvvttttttbtvvvttvbvtvvbvtbtvtbvttvvtbt","bvtbttv","bbbt","vtt","ttvv","b","vbb","vtvvbtttvtbbvvbbtbb","vvv","vvvvbbbtbbbvbbbb","ttvvbtvv","v","btvbbvtbbvbvtvttvvbbbtbvvvtbtb","vv","btbttbtbbvbvvbvttbttvtbbtbvtttvbbtbbtvtvvvvbbttvtvvbbbv","ttvbbbbttbtbtb","tvvbvbvvb","vv","ttbttvtvbtbbbbv","bvvvtbbvvvbtvbvtvtvvvvbb","vtbvvbvvvvvttvbbttbbvtvt","tbvbbt","b","v","tvbbtvvtvvtbtbttvvvb","tbttbttbbbtbtvtvtvtbbbvvtbbbvbbvvvbbttvvt","bbvttvtvvtbvbbttvbbtbvvttbvbvbtbvvvbbbvbvbvbtvbtvvvtvvtbttbttbbvbbbttvvvbvvtb","vttvvbvv","tbttbvvttvbtvvtbbvvv","bvbbbbbbbb","vtbvvtbbvtt","bvttbvvbvb","tvttttbbvvvbbtttvvv"], "btbvtttttbvttbvvbbtvvbvbvvbtbtbtvbtttbvbbbtbbtbvvttbvbvtvbtbbttbvvbvbtttbvttbvvbbvvv")
