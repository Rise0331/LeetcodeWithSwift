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

![](http://op6guxky2.bkt.clouddn.com/Plus-One.png)

思路：使用变量carry保存进位，一开始是1，就是本身要加的那个1，然后从后往前逐位相加上进位，求余得到位置i的结果，再计算下一位的进位。遍历结束如果进位是1，还需要在结果数组的最前面添加1，最为最后结果。

```swift
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

#### 118. Pascal's Triangle

类型: Array

![](http://op6guxky2.bkt.clouddn.com/Pascal%27s-Triangle.png)

举个例子：看一个由5行组成的杨辉三角，将它的输出对齐，可以看到从第三行开始，除了第一个和最后一个元素外，每个元素符合如下规律：a[row][col] = a[row - 1][col] + a[row - 1][col - 1]，即当前元素值等于 **上一行对应位置的元素** 加上 **上一行相对前一位置的元素** 。

```
Output:
[
 [1],
 [1,1],
 [1,2,1],
 [1,3,3,1],
 [1,4,6,4,1]
]
```

```swift
class Solution {
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
```

#### 119. Pascal's Triangle II

类型: Array

![](http://op6guxky2.bkt.clouddn.com/pascal-triangle-2.png)

```swift
class Solution {
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
```

#### 88. Merge Sorted Array

类型: Array

![](http://op6guxky2.bkt.clouddn.com/merge-sorted-array.png)

思路：nums1由m个元素，nums2有n个元素，最终合并到nums1后，nums1将有(m + n)个元素，设 i = (m + n - 1)，表示即将合并到数组的较大值对应的下标，从后往前比较nums1和nums2中的元素，将大的元素放到i对应的位置，递减i，同时递减较大值数组的下表，继续比较。比较结束，如果nums2还有剩余的元素，应将这些元素复制到nums1。

```swift
class Solution {
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
```

#### 1. Two Sum

类型: Array, Hash Table

![](http://op6guxky2.bkt.clouddn.com/two-sum-problem.png)

思路：构造一个字典，用来保存数组元素和元素对应的下标，每遍历到一个元素就去检查，(traget - element)是否已经在字典中，在的话返回两个元素的下标，这里要求小的下标在前面。还应该注意两个元素值相等的情况，即target = element * 2。

```swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numsDict = [Int: Int]()
        
        for index in 0..<nums.count {
            let element = nums[index]
            
            if let anotherIndex = numsDict[target - element],
                index != anotherIndex {
                return [min(index, anotherIndex), max(index, anotherIndex)]
            }
            
            numsDict[element] = index
        }
        
        return [nums.index(of: target / 2)!, numsDict[target / 2]!]
    }
}
```


#### 74. Search a 2D Matrix

类型: Array, Binary Search

![](http://op6guxky2.bkt.clouddn.com/search-a-2d-matrix.png)

思路：矩阵的每一行都是有序的，而且下一行的元素一定比上一行的要大，因此可以先确定目标元素所在的行，接着使用二分查找进行判断目标元素是否存在。

```swift
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        for row in matrix {
            if let first = row.first, let last = row.last, first <= target && target <= last {
                return binarySearch(numbers: row, target: target)
            }
        }
        
        return false
    }
    
    func binarySearch(numbers: [Int], target: Int) -> Bool {
        var low = 0
        var high = numbers.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if numbers[mid] < target {
                low = mid + 1
            } else if numbers[mid] > target {
                high = mid - 1
            } else {
                return true
            }
        }
        
        return false
    }
}
```


#### 35. Search Insert Position

类型: Array, Binary Search

![](http://op6guxky2.bkt.clouddn.com/search-insert-position.png)

思路：采用二分查找，找到最接近目标值的下标，如果下标等于数组的长度，则目标值是最后一个元素；如果下表对应的值大于等于目标值，该下标就是目标值应该所在的位置；当下标对应的值小于目标值，则目标值对应的位置在下标的后一位置。


```swift
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        let targetIndex = binarySearch(numbers: nums, target: target)

        if targetIndex >= nums.count {
            return targetIndex
        }
        
        if nums[targetIndex] >= target {
            return targetIndex
        } else {
            return targetIndex + 1
        }
    }
    
    func binarySearch(numbers: [Int], target: Int) -> Int {
        var low = 0
        var high = numbers.count - 1
        var mid = low + (high - low) / 2
        
        while low <= high {
            if numbers[mid] < target {
                low = mid + 1
            } else if numbers[mid] > target {
                high = mid - 1
            } else {
                break
            }
            
            mid = low + (high - low) / 2
        }
        
        return mid
    }
}
```


#### 268. Missing Number

类型: Bit Manipulation

![](http://op6guxky2.bkt.clouddn.com/missing-number.png)

思路：异或(XOR)运算，两个数相等时，结果为零。从0开始取n个连续的数，最小的数为0，最大的数为n-1。假设现在有另一个数组nums2包含0到n-1, 将nums中的元素与nums2进行异或，成对出现的数字异或的结果为0，只出现一次的就是缺失的数字，这里可以用nums数组的下标来模拟nums2的元素，最后再异或上最大的数字，最大的数字就是nums.count，得到的就是最终结果。

```swift
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var result = 0
        for i in 0..<nums.count {
            result ^= (i ^ nums[i])
        }
        return result ^ nums.count
    }
}
```

#### 2. Add Two Numbers

类型: List

![](http://op6guxky2.bkt.clouddn.com/add-two-numbers.png)

思路：遍历链表进行累加求和，最后需要根据l1 和 l2是否已经遍历到最后一个节点，分别进行处理。

```swift
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        
        var tmpL1 = l1
        var tmpL2 = l2
        var prevL1 = tmpL1
        var prevL2 = tmpL2
        var carry = 0
        
        while tmpL1 != nil && tmpL2 != nil {
            let sum = tmpL1!.val + tmpL2!.val + carry
            tmpL1?.val = sum % 10
            tmpL2?.val = sum % 10
            carry = sum / 10
            
            prevL1 = tmpL1
            prevL2 = tmpL2
            
            tmpL1 = tmpL1?.next
            tmpL2 = tmpL2?.next
        }
        
        if tmpL1 == nil && tmpL2 == nil {
            if carry == 1 {
                prevL1?.next = ListNode(1)
            }
            return l1
        } 
        
        if tmpL1 == nil {
            while tmpL2 != nil {
                let sum = tmpL2!.val + carry
                tmpL2?.val = sum % 10
                carry = sum / 10
                
                prevL2 = tmpL2
                tmpL2 = tmpL2?.next
            }
            
            if carry == 1 {
                prevL2?.next = ListNode(1)
            }
            return l2
        }
        
        while tmpL1 != nil {
            let sum = tmpL1!.val + carry
            tmpL1?.val = sum % 10
            carry = sum / 10
            
            prevL1 = tmpL1
            tmpL1 = tmpL1?.next
        }
        
        if carry == 1 {
            prevL1?.next = ListNode(1)
        }
        
        return l1
    }
}
```


#### 2. Maximum Depth of Binary Tree

类型: Tree

![](http://op6guxky2.bkt.clouddn.com/Maximum-Depth-Of-Binary-Tree.png)

思路：通过递归获取左右子树的深度，整棵树的最大深度为，左右子树深度的最大值加1.

```swift
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        
        if root == nil {
            return 0
        }
        
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
}
```