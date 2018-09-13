#### 27. Remove Element

类型: Array, Two Pointers

![](http://op6guxky2.bkt.clouddn.com/DX-20180911@2x.png)

思路: 使用j记录当前非value元素的长度，i向后遍历查找不等于value的元素，找到后，将处于i位置的元素复制到j位置，将j增加1，表示非value元素个数加1，同时也表示移动到下一位置，遍历结束得到最终的长度。

```swift
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
```


#### 26. Remove Duplicates from Sorted Array

类型: Array, Two Pointers

![](http://op6guxky2.bkt.clouddn.com/remove-duplicate-element-in-sorted-array.png)

```swift
class Solution {
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
```

#### 80. Remove Duplicates from Sorted Array (2)

类型: Array, Two Pointers

![](http://op6guxky2.bkt.clouddn.com/remove-duplicate-element-from-sorted-array2.png)

思路：使用一个额外的变量(代码中用duplicateCount)来记录后续元素和当前元素重复的个数，后面的元素如果和当前元素相同，则duplicateCount加1，当duplicateCount小于2(或者说等于1时)，保存这个重复的元素，超过1的话，丢弃重复的元素。后面的元素和当前元素不同的话，直接将当前保存的length加1，并将后面的元素复制到length对应的位置，将duplicateCount置0。

```swift
class Solution {
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
```


#### 66. Plus One

类型: Array

```
class Solution {
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
```