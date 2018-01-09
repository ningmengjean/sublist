//Solution goes in Sources
import Foundation

enum Sublist {
    case equal
    case sublist
    case unequal
    case superlist
}

func classifier(listOne:[Int], listTwo: [Int]) -> Sublist{
    if listOne.isEmpty && listTwo.isEmpty {
        return .equal
    } else if listOne.isEmpty && !listTwo.isEmpty {
        return .sublist
    } else if !listOne.isEmpty && listTwo.isEmpty {
        return .superlist
    } else {
        if listOne.count == listTwo.count {
            if listOne.elementsEqual(listTwo) {
                return .equal
            } else {
                return .unequal
            }
        } else if listOne.count > listTwo.count {
            if listOne.isSuperArrayOf(listTwo) {
                return .superlist
            } else {
                return .unequal
            }
        } else if listOne.count < listTwo.count {
            if listTwo.isSuperArrayOf(listOne) {
                return .sublist
            } else {
                return .unequal
            }
        }
    }
    return .unequal
}

extension Array where Element: Comparable {
    func isSuperArrayOf(_ shorterArray: [Element]) -> Bool {
        assert(self.count >= shorterArray.count, "passed in array must equal or shorter than self")
        
        for (i, e) in self.enumerated() {
            if e == shorterArray[0] {
                var isSub = true
                for (j, s) in shorterArray.enumerated() {
                    if i + j < self.count {
                        if s != self[i + j] {
                            isSub = false
                        }
                    } else {
                        isSub = false
                    }
                }
                if isSub {
                    return isSub
                }
            }
        }
        
        return false
    }
}
