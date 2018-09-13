//: Playground - noun: a place where people can play

/*
 * Given an array nums and a value val, remove all instances of that value in-place and return the new length.
 * Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 * The order of elements can be changed. It doesn't matter what you leave beyond the new length.
 *
 * Example 1:
 * Given nums = [3,2,2,3], val = 3,
 * Your function should return length = 2, with the first two elements of nums being 2.
 * It doesn't matter what you leave beyond the returned length.
 *
 *
 * Example 2:
 * Given nums = [0,1,2,2,3,0,4,2], val = 2,
 * Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4.
 * Note that the order of those five elements can be arbitrary.
 * It doesn't matter what values are set beyond the returned length.
 *
 */

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var j = 0
        
        for i in 0..<nums.count {
            if nums[i] == val {
                continue
            }
            
            nums[j] = nums[i]
            j += 1
        }
        
        return j
    }
}


//: ### problem 26 -- Remove Duplicates from Sorted Array
//: ![](remove-duplicate-element-in-sorted-array.png)
class Solution26 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        
        var j = 0
        for i in 0..<nums.count {
            if nums[i] != nums[j] {
                nums[j + 1] = nums[i]
                j += 1
            }
        }
        
        return j + 1
    }
}

//: ### Problem 80 -- Remove Duplicates from Sorted Array II
//: ![](remove-duplicate-element-from-sorted-array2.png)
class Solution80 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        
        var length = 0
        var duplicateCount = 0
        
        for i in 1..<nums.count {
            if nums[i] == nums[length] {
                duplicateCount += 1
                if duplicateCount < 2 {
                    length += 1
                    nums[length] = nums[i]
                }
            } else {
                length += 1
                nums[length] = nums[i];
                duplicateCount = 0
            }
        }
        
        return length + 1
    }
}


//: ### Problem 66 --- Plus One
//: ![](Plus-One.png)
class Solution66 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: digits.count)
        var carry = 1
        
        for i in (0..<digits.count).reversed() {
            result[i] = (digits[i] + carry) % 10
            carry = (digits[i] + carry) / 10
        }
        
        if carry == 1 {
            result.insert(1, at: 0)
        }
        
        return result
    }
}

