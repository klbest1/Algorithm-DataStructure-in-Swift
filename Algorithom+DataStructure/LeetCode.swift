//
//  LeetCode.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 3/7/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

// Definition for singly-linked list.
public class ListNode:Comparable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
    
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
    
    public static func < (lhs: ListNode, rhs: ListNode) -> Bool{
        return lhs.val < rhs.val
    }

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func <= (lhs: ListNode, rhs: ListNode) -> Bool{
        return lhs.val <= rhs.val

    }

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func >= (lhs: ListNode, rhs: ListNode) -> Bool{
        return lhs.val >= rhs.val

    }

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func > (lhs: ListNode, rhs: ListNode) -> Bool{
        return lhs.val > rhs.val

    }
 }


class LeetCode: NSObject {
    //2017年0703
    func maximumProduct(_ nums: [Int]) -> Int {
        
        //让逻辑每个都执行一次的方法就是，让最大数等于最小的，最小的等于最大的即可
        var max1 = -1000;
        var max2 = -1000;
        var max3 = -1000;
        var min1 = 1000
        var min2 = 1000;
        for i in 0..<nums.count{
            let num = nums[i]
            if(min1 > num){
                min2 = min1
                min1 = num;
            }else if(min2 > num){
                min2 = num
            }
            
            if(max1 < num ){
                max3 = max2;
                max2 = max1;
                max1 = num;
            }else if(max2 < num){
                max3 = max2
                max2 = num;
            }else if(max3 < num){
                max3 = num
            }
        }
        
        let production = max(min1*min2*max1,max1*max2*max3)
        return production
    }
    
    // a[0,1,2,3,4,5,6,7,8,9]
    // b[6,2,1,0,0,0,1,0,0,0]
    
    func getArraysOfAddsToTen() -> [[Int]] {
        
        var arraysToTen = [[Int]]()
        for i in 0..<10{
            var numbersToTen = Array(repeating: 0, count: 10)
            let numbersSets = NSCountedSet()
            numbersToTen[0] = i;
            numbersSets.add(i);
            
            for j in 0..<10{
                if(i+j > 10){
                    break;
                }
                numbersToTen[1] = j;
                numbersSets.add(j);
                for k in 0..<10{
                    if(i+j+k > 10){
                        break;
                    }
                    numbersToTen[2] = k;
                    numbersSets.add(k);
                    for l in 0..<10{
                        if(i+j+k+l > 10){
                            break;
                        }
                        numbersToTen[3] = l;
                        numbersSets.add(l);

                        for m in 0..<10{
                            if(i+j+k+l+m > 10){
                                break;
                            }
                            numbersToTen[4] = m;
                            numbersSets.add(m);

                            for n in 0..<10{
                                if(i+j+k+l+m+n > 10){
                                    break;
                                }
                                numbersToTen[5] = n;
                                numbersSets.add(n);

                                for o in 0..<10{
                                    if(i+j+k+l+m+n+o > 10){
                                        break;
                                    }
                                    numbersToTen[6] = o;
                                    numbersSets.add(o);

                                    for p in 0..<10{
                                        if(i+j+k+l+m+n+o+p > 10){
                                            break;
                                        }
                                        numbersToTen[7] = p;
                                        numbersSets.add(p);

                                        for q in 0..<10{
                                            if(i+j+k+l+m+n+o+p+q > 10){
                                                break;
                                            }
                                            numbersToTen[8] = q;
                                            numbersSets.add(q);

                                            for r in 0..<10{
                                                if(i+j+k+l+m+n+o+p+q+r > 10){
                                                    break;
                                                }
                                                numbersToTen[9] = r;
                                                numbersSets.add(r);

                                                if(i+j+k+l+m+n+o+p+q+r == 10 && checkTimesEqual(array: numbersToTen, countedSet: numbersSets)){
                                                    arraysToTen.append(numbersToTen);
                                                }else{
                                                    numbersSets.remove(r)
                                                }
                                            }
                                            numbersSets.remove(q)
                                        }
                                        numbersSets.remove(p)
                                    }
                                    numbersSets.remove(o)
                                }
                                numbersSets.remove(n)
                            }
                            numbersSets.remove(m)
                        }
                        numbersSets.remove(l)
                    }
                    numbersSets.remove(k)
                }
                numbersSets.remove(j)
            }
            numbersSets.remove(i)
        }
        
        return arraysToTen;
    }
    
    func checkTimesEqual(array:[Int],countedSet:NSCountedSet) -> Bool {
        for i in 0..<array.count{
            let times = array[i];
            let realTimes = countedSet.count(for: i);
            if times != realTimes {
                return false;
            }
        }
        return true;
    }
    
    
    //数组反转 204题，已经过测试
    func reverseList(_ head: ListNode?) -> ListNode? {
       
        guard head?.next != nil else {
            return head
        }
        var preNode:ListNode? = head;
        var currentNode = head?.next
        var nextNode = currentNode?.next
        
        //第一个节点置空
        preNode?.next = nil;
        currentNode?.next = preNode;
        
        while nextNode != nil {
            preNode = currentNode;
            currentNode = nextNode;
            //保存next节点，当current改变指向时，方便继续遍历链表
            nextNode = currentNode?.next;
            //逆序改变指向
            currentNode?.next = preNode;
            
        }
        return currentNode;
    }
    
    //指针对撞 167题
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count > 1 else {
            return []
        }
        var i = 0;
        var j = numbers.count-1;
        while i < j {
            let sum = numbers[i] + numbers[j];
            if sum == target {
                return [i+1,j+1]
            }else
            if sum < target {
                i += 1;
            }else
            if sum > target {
                j -= 1;
            }
        }
        return [];
    }
    
    // 125题，字符串倒序输出
    
    //209题 最短连续子数组 大于 S
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0;
        }
        var sum = 0;
        var i = 0;
        var j = 0;
        var length = nums.count;
        sum = nums[i] ;
        while i < nums.count  && j < nums.count{
            if sum < s {
                sum += nums[j];
                j += 1
            }else if(sum >= s){
//                length = min(j - i + 1, length)
                sum -= nums[i];
                i += 1
            }
            
            if sum >= s {
                length = min(j - i, length)
            }

        }
        if length == nums.count {
            return 0;
        }
        return length;
    }
    
    
    //94 堆栈实现中序遍历
    //* Definition for a binary tree node.
    public class TreeNode {
        public var val: Int
         public var left: TreeNode?
         public var right: TreeNode?
         public init(_ val: Int) {
             self.val = val
             self.left = nil
             self.right = nil
         }
     }
    
    struct CommondNode {
        var node:TreeNode?
        var commond:String?
    }
    
    //中序遍历  执行顺序 左 中 右 ，因此左最后入栈
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else{
            return [];
        }
        var res:[Int] = [Int]()
        var commondStack:Stack<CommondNode> = Stack();
        let commondRoot = CommondNode(node: root, commond: "go");
        commondStack.push(commondRoot);
        while !commondStack.isEmpty {
            let commd = commondStack.pop();
            
            if  commd?.commond == "print" , let value = commd?.node?.val{
                res.append(value)
            }else{
                var commondNode:CommondNode? = nil
                //右节点
                if let right = commd?.node?.right{
                    commondNode = CommondNode(node: right, commond: "go")
                    commondStack.push(commondNode!);
                }
                //中节点 打印节点
                commondNode = CommondNode(node: commd?.node, commond: "print")
                commondStack.push(commondNode!);
                //左节点
                if let left = commd?.node?.left{
                    commondNode = CommondNode(node: left, commond: "go")
                    commondStack.push(commondNode!);
                }
            }
        }
        
        return res;
        
    }
    
    
    
// Definition for singly-linked list.
    //2020/04/05 23合并k个有序数组
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard  lists.count > 0 else {
            return nil
        }
        
        guard lists.count > 1 else {
            return lists[0]
        }
        
        let k = lists.count
        var resultList:ListNode? = nil
        var resultListCurrent:ListNode? = nil;
        let heap = HeapPriorityQueue(capacity: k * 2);
        var currentsHeads = [ListNode?]()
        for list in lists {
            currentsHeads.append(list);
        }
        
        while currentsHeads.count > 0 {
            for i in 0..<currentsHeads.count{
                if let  current = currentsHeads[i]{
                    currentsHeads[i] = current.next
                    //注意这里要置空啊，不能保留原来的指向
                    current.next = nil;
                    heap.push(data: current)
                }
                
                //放这里并没有推入3个数组中的最小值，堆就pop了
//                if heap.count >  k {
//                    let minMumNode = heap.extractValue()
//                    if resultList == nil {
//                        resultList = minMumNode;
//                        resultListCurrent = minMumNode;
//                    }else{
//                        resultListCurrent?.next = minMumNode;
//                        resultListCurrent = resultListCurrent?.next
//                    }
//                }
            }
            
            //要同时推k个进来再比较
            if heap.count >  k {
                let minMumNode = heap.extractValue()
                if resultList == nil {
                    resultList = minMumNode;
                    resultListCurrent = minMumNode;
                }else{
                    resultListCurrent?.next = minMumNode;
                    resultListCurrent = resultListCurrent?.next
                }
            }
            //移除检查完的链表
            currentsHeads = currentsHeads.filter{$0 != nil}
        }
        
        while !heap.isEmpty(){
            if resultList == nil {
                resultList = heap.extractValue();
                resultListCurrent = resultList;
            }else{
                let node = heap.extractValue();
                resultListCurrent?.next = node;
                resultListCurrent = resultListCurrent?.next
            }
            
            if resultListCurrent == nil {
                break;
            }
        }
        
        return resultList;
    }
    
    //2020/04/05
        func mergeKLists1(_ lists: [ListNode?]) -> ListNode? {
            guard  lists.count > 0 else {
                return nil
            }
            
            guard lists.count > 1 else {
                return lists[0]
            }
            
            let k = lists.count
            //创建虚拟头结点，就不用再去判断空指针了
            let head:ListNode = ListNode(0);
            var current:ListNode = head;
            let heap = HeapPriorityQueue(capacity: 2);
            var currentsHeads = [ListNode?]()
            for list in lists {
                currentsHeads.append(list);
            }
            
            while currentsHeads.count > 0 {
                for i in 0..<currentsHeads.count{
                    if let  current = currentsHeads[i]{
                        currentsHeads[i] = current.next
                        //注意这里要置空啊，不能保留原来的指向
                        current.next = nil;
                        heap.push(data: current)
                    }
                }
                
                //同时推k个进来再比较
                if heap.count >  k {
                    guard let minMumNode = heap.extractValue() else {
                        continue
                    }
                    current.next = minMumNode;
                    current = minMumNode
                }
                //移除检查完的链表
                currentsHeads = currentsHeads.filter{$0 != nil}
            }
            
            while !heap.isEmpty(){
              guard let minMumNode = heap.extractValue() else {
                    continue
              }
              current.next = minMumNode;
              current = minMumNode
            }
            
            return head.next;
        }
    
    func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
            guard  lists.count > 0 else {
                return nil
            }
            
            guard lists.count > 1 else {
                return lists[0]
            }
            
           //创建虚拟头结点，就不用再去判断空指针了
            let head:ListNode = ListNode(0);
            var current:ListNode = head;
            let heap = HeapPriorityQueue(capacity: 2);
            for list in lists {
                if let l = list {
                    //推入k个数组
                    heap.push(data: l)
                }
            }
            
            while !heap.isEmpty(){
                guard  let minimumNode = heap.extractValue() else{
                    continue
                }
                
//                let node = ListNode(minimumNode.val)
               
                current.next = minimumNode;
                current = minimumNode;
                //推出弹出的那个结点后面的节点，该节点为数组第二小节点
                if let next = minimumNode.next {
                    heap.push(data: next)
                }
            }
            
             return head.next;
        }
    
    
    func minDepth(_ root: TreeNode?) -> Int {
           guard let root = root else{
               return 0
           }
        
        
        if(root.left != nil && root.right != nil){
            let leftLevel = minDepth(root.left);
            let rightLevel = minDepth(root.right);
            return min(leftLevel, rightLevel) + 1;
        }
        
        return 0
    }
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        let minimums = inorderTraversal(root)
        
        if( k < minimums.count && k > -1){
            return minimums[k]
        }
        
        return 0
    }
    
    
    var res:[[Int]] = [[Int]]()
    var a:[Bool]!
    
    //leetCode 46题
    func permute(_ nums: [Int]) -> [[Int]] {
       
        guard nums.count > 0 else {
            return []
        }
        
        a = Array(repeating: false, count: nums.count)
        var p:[Int] = [Int]();
        findIntegers(nums,0,&p)
        
        return res;
    }
    
    func findIntegers(_ nums:[Int], _ index:Int, _ p:inout [Int]){
        if(index  == nums.count){
            print("找到了一个解:\(p.description) return")
            res.append(p)
            return;
        }
        for i in 0..<nums.count{
            if(!a[i]){
                a[i] = true;
                p.append(nums[i])
                print("添加元素\(nums[i]) index:\(i)")
                findIntegers(nums ,index + 1,&p)
                //回退一个就可以。全部移除调就无限循环了。
                a[i] = false
                p.removeLast()
                print("重置元素a:\(a.description) p:\(p.description) index:\(i)")
            }
        }
        print("函数结束return")

    }
    
    var columns:[Int] = [Int]();
    var rows:[Int] = [Int]();
    var xLeft:[Int] = [Int]();
    var xRight:[Int] = [Int]();
    var queensRes:[[Int]] = [[Int]]()

    //51. N-Queens
    func solveNQueens(_ n: Int) -> [[String]] {
        var result:[Int] = [Int].init(repeating: -1, count: n );
        columns = [Int].init(repeating: 0, count: n );
        rows = [Int].init(repeating: 0, count: n );
        xLeft = [Int].init(repeating: 0, count: 2*n - 1)
        xRight = [Int].init(repeating: 0, count: 2*n - 1)

        queensRes.removeAll()
        
        findQueens(0, n , ressult: &result)
        
        return getStringArray(n);
    }
    
    func getStringArray(_ n:Int) -> [[String]] {
        var allStrings:[[String]] = [[String]]()

        for i in 0..<queensRes.count{
            var stringArray:[String] = [String]()
            let result = queensRes[i]
            for j in 0..<n{
                var resultString = "";
                let changeQindex = result[j]
                for k in 0..<n{
                    var dotString = "."
                    if(changeQindex == k){
                        dotString = "Q"
                    }
                    resultString += dotString
                }
                stringArray.append(resultString)
            }
            allStrings.append(stringArray)
        }

        return allStrings
    }
    
    func isInvalidate(_ i:Int, _ j:Int,queens n:Int) ->Bool {
       
        return rows[i] != 1 && columns[j] != 1 && xLeft[i-j+n-1] != 1 && xRight[i+j] != 1
    }
    
    func findQueens(_ row:Int,_ n:Int ,  ressult:inout [Int])  {
        if(row == n ){
            queensRes.append(ressult);
            print("找到结果:\(getStringArray(n))");
            //满足条件退出
            return
        }
        for j in 0..<n{
           if self.isInvalidate(row, j, queens: n) {
               rows[row] = 1
               columns[j] = 1;
               xLeft[row-j+n-1] = 1;
               xRight[row+j] = 1
               //保存满足条件结果
               ressult[row] = j;
               print("找到位置:\(row)行 ，\(j)列 result:\(ressult)");
               //继续向下寻找
               findQueens(row + 1, n, ressult: &ressult)
               //回退
               rows[row] = 0
               columns[j] = 0;
               xLeft[row-j+n-1] = 0;
               xRight[row+j] = 0
               ressult[row] = -1;
               print("回退到:\(row)行 ，\(j)列 result:\(ressult)");
           }
        }
    }
}



