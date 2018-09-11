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