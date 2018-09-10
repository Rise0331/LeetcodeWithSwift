//: Playground - noun: a place where people can play

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var j = nums.count - 1
        
        while i <= j {
            while i <= j && nums[i] != val {
                i += 1
            }
            
            while i <= j && nums[j] == val {
                j -= 1
            }
            
            if ( i <= j) {
                nums[i] = nums[j]
                i += 1
                j -= 1
            }
        }
        
        return i
    }
}
