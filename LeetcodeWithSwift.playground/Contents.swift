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

//: ### Problem 118 --- Pascal's-Triangle
//: ![](Pascal's-Triangle.png)
class Solution118 {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        
        if numRows == 0 {
            return result
        }
        
        if numRows == 1 {
            return [[1]]
        }
        
        result.append([1])
        
        for row in 1..<numRows {
            var newRow = [1]
            let prevRow = result[row - 1]
            
            if prevRow.count > 1 {
                for i in 1..<prevRow.count {
                    newRow.append(prevRow[i - 1] + prevRow[i])
                }
            }
            
            newRow.append(1)
            result.append(newRow)
        }
        
        return result
    }
}

//: ### Problem 119 --- Pascal's Triangle II
//: ![](pascal-triangle-2.png)
class Solution119 {
    func getRow(_ rowIndex: Int) -> [Int] {
        var prevRow = [1]
        var curRow = [1, 1]
        
        if rowIndex == 0 {
            return prevRow
        }
        
        if rowIndex == 1 {
            return curRow
        }
        
        for _ in 2...rowIndex {
            prevRow = curRow
            var tmpRow = [1]
            for i in 1..<prevRow.count {
                tmpRow.append(prevRow[i] + prevRow[i - 1])
            }
            tmpRow.append(1)
            
            curRow = tmpRow
        }
        
        return curRow
    }
}

//: ### Problem 88 --- Merge Sorted Array
//: ![](merge-sorted-array.png)
class Solution88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if (m == 0) {
            nums1 = nums2
            return
        }
        
        if (n == 0) {
            return
        }
        
        var tmpM = m - 1
        var tmpN = n - 1
        
        for i in (0..<(m + n)).reversed() {
            if nums1[tmpM] > nums2[tmpN] {
                nums1[i] = nums1[tmpM]
                tmpM -= 1
            } else {
                nums1[i] = nums2[tmpN]
                tmpN -= 1
            }
            
            if (tmpM < 0 || tmpN < 0) {
                break
            }
        }
        
        while (tmpN >= 0) {
            nums1[tmpN] = nums2[tmpN]
            tmpN -= 1
        }
    }
}

