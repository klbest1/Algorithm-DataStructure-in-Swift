//
//  Exercise.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 24/5/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

//习题1：从100 0000 个数中取出前100个
class HeapForChosingNumberInGroup<T:Comparable>: NSObject {
    private var tasks:[T]!;
    private var indexes:[Int]!
    private var capacity:Int!
    private var count:Int
    
    init(withCapicity capacity:Int , type:T) {
        self.capacity = capacity;
        tasks = Array(repeating: type, count: capacity);
        indexes = Array(repeating: 0, count: capacity);
        count = 0;
    }
    
    func insertNumber(value:T)  {
        if count == capacity  {
            let temp = tasks[indexes[0]];
            if  value  > temp{
                tasks[indexes[0]] = value;
                shiftDown(index: 0);
            }
            return;
        }
        
        count += 1;
        tasks[count-1] = value;
        indexes[count-1] = count-1;
        shiftUp(index: count - 1);
        
    
    }
    
    func isEmpty() -> Bool {
        return count <= 0;
    }
    
    func extractMin() -> T?{
        guard count > 0 else {
            return nil;
        }
        
        let item = tasks[indexes[0]];
        
        if count == 1 {
            count -= 1;
            return item;
        }
        
        swap(&indexes[0], &indexes[count-1]);
        count -= 1;
        shiftDown(index: 0);
        
        return item;

    }
    
    func shiftUp(index:Int)  {
        var first = index;
        while first>=0  {
            let parent = (first-1)/2;
            let leftChild = parent * 2 + 1;
            let rightChild = leftChild + 1;
            
            var temp = parent;
            if leftChild < count && tasks[indexes[leftChild]]  < tasks[indexes[parent]] {
                temp = leftChild;
            }
            
            if rightChild < count && tasks[indexes[rightChild]] < tasks[indexes[temp]] {
                temp = rightChild;
            }
            
            if temp == parent {
                return;
            }
            
            swap(&indexes[parent], &indexes[temp]);
            first = parent;
        }
    }
    
    func shiftDown(index:Int)  {
        var parent = index;
        while parent < count {
            let leftChild = parent*2 + 1;
            let rightChild = leftChild + 1;
            
            var temp = parent;
            if leftChild < count && tasks[indexes[leftChild]] <  tasks[indexes[temp]]{
                temp = leftChild;
            }
            
            if rightChild < count && tasks[indexes[rightChild]] < tasks[indexes[temp]] {
                temp = rightChild;
            }
            
            if temp == parent {
                return;
            }
            
            swap(&indexes[temp], &indexes[parent]);
            parent = temp;
        }
    }
}


class ExerciseForSelectSort<T:Comparable>: BaseSort {
    override func sortArray<T>(_ array: inout [T]) where T : Comparable {
        for j in 0..<array.count{
            var miniNumberIndex = j;
            var miniNumber = array[j];
            for i in (j + 1)..<array.count{
                if array[i] < miniNumber {
                    miniNumber = array[i];
                    miniNumberIndex = i;
                }
            }
            let temp = array[j];
            array[j] = miniNumber
            array[miniNumberIndex] = temp;
        }

    }
}


class ExerciseForInsertSort: BaseSort {
    override func sortArray<T>(_ array: inout [T]) where T : Comparable {
        for i in 1..<array.count{
            let temp = array[i];
            var finalJ = i-1
            for j in ((i - 1)..<array.count).reversed(){
                if temp < array[j] {
                    array[j + 1] = array[j];
                }else{
                    finalJ = j + 1;
                    break;
                }
            }
            array[finalJ] = temp;
        }
        
    }
}

class ExerciseForMergeSort: BaseSort {
    override func sortArray<T:Comparable>(_ array: inout [T]) where T : Comparable {
        mergeSort(&array, L: 0, R: array.count - 1)
    }
    
    func mergeSort<T:Comparable>(_ array:inout [T], L:Int,R:Int)  {
        let middle = (L + R)/2;
        if L >= R {
            return;
        }
        mergeSort(&array, L: L, R: middle)
        mergeSort(&array, L: middle + 1, R: R);
        merge(array: &array, L: L, M: middle, R: R)
    }
    
    func merge<T:Comparable>(array:inout [T],L:Int,M:Int,R:Int)  {
        var copyArray = Array(repeating: array[0], count: R-L + 1);
        for i in L...R{
            let value = array[i];
            copyArray[i-L] = value;
        }
        
        var leftIndex = L;
        var rightIndex = M + 1;
        for i in L...R{
            var minNumber = copyArray[leftIndex - L];
            if leftIndex > M {
                minNumber = copyArray[rightIndex - L];
                rightIndex += 1;
            }else if rightIndex > R{
                minNumber = copyArray[leftIndex - L];
                leftIndex += 1;
            }else if array[rightIndex] < minNumber{
                minNumber = copyArray[rightIndex - L];
                rightIndex += 1;
            }else{
                leftIndex += 1;
            }
            array[i] = minNumber;
        }
    }
    
    class Node<T> {
        var value:T
        var index:Int!
        var next:Node?;
        var pre:Node?;
        init(value:T) {
            self.value = value;
        }
    }
    
    class ExerciseLinkesList<T:Comparable>: NSObject {
        var count:Int = 0;
        var head:Node<T>?
        var tail:Node<T>?
        
        
        func append(value:T)  {
            let node = Node(value: value);
            node.next = nil;
            node.index = count
            count += 1;
            if let tempTail = tail {
                tempTail.next = node;
                node.pre = tempTail;
            }else{
                node.pre = nil;
                head = node;
            }
            tail = node;
        }
        
        func nodeAtIndex(index:Int) -> Node<T>? {
            guard index < count else {
                return nil;
            }
            
            var current = head;
            while current != nil  {
                if current!.index ==  index{
                    return current;
                }
                current = current!.next;
            }
            
            return nil;
        }
        
        func removeNodeAtIndex(index:Int) -> Bool{
            guard index < count else {
                print("linkedList index out of range");
                return false;
            }
            
            var current = head;
            while current != nil  {
                if current!.index ==  index{
                    current!.pre?.next = current?.next;
                    current?.next?.pre = current?.pre;
                    current = nil;
                    return true;
                }
                current = current!.next;
            }
            
            return false;
        }
    }
    
}

//2017年6月19日
class ExerciseMergeSort:BaseSort{
    override func sortArray<T>(_ array: inout [T]) where T : Comparable {
        mergeSort(array: &array, L: 0, R: array.count-1)
    }
    
    func mergeSort<T:Comparable>(array:inout [T],L:Int,R:Int)  {
        if L >= R {
            return;
        }
        let M:Int = (L + R)/2
        mergeSort(array: &array, L: L, R: M);
        mergeSort(array: &array, L: M+1, R:R );
        merge(array: &array, L: L, M: M, R: R)
    }
    
    func merge<T:Comparable>(array:inout [T],L:Int,M:Int,R:Int)  {
        var copyArray:[T] = Array(repeating: array[L], count: R-L+1);
        //copy 一份
        for i in L...R{
            copyArray[i-L] = array[i];
        }
        
        var ls = L-L;
        var rs = M-L+1;
        for i in L...R{
            if (ls >= M-L+1) {
                array[i] = copyArray[rs]
                rs += 1;
            }else if( rs > R-L){
                array[i] = copyArray[ls];
                ls += 1;
            }else if(copyArray[ls] < copyArray[rs]){
                array[i] = copyArray[ls];
                ls += 1;
            }else {
                array[i] = copyArray[rs];
                rs += 1
            }
        }
    }
}

//2017年6月20日,
//append, objectAtIndex,deleted
class NodeOne<T:Comparable>{
    var value:T
    init(value:T) {
        self.value = value;
    }
    
    var index:Int?
    var pre:NodeOne<T>?
    var next:NodeOne<T>?
}

class ExerciseLinkList<T:Comparable>:NSObject{
    var head:NodeOne<T>?
    var tail:NodeOne<T>?
    var count:Int = 0;
    
    func append(value:T)  {
        let node:NodeOne<T> = NodeOne(value: value);
        node.next = nil;
        node.index = count;
        count += 1
        
        if let tempTail = tail{
            tempTail.next = node;
            node.pre = tempTail;
            tail = node;
        }else{
            node.pre = nil;
            head = node;
        }
        tail = node;
    }
    
    func objectAtIndex(index:Int) -> NodeOne<T>? {
        var current = head;
        while current != nil {
            if current!.index == index {
                return current!;
            }
            current = current?.next;
        }
        return nil
    }
    
    
    func deleteObjectAtIndex(index:Int)->Bool  {
        print("删除第\(index)个节点:");
        var current = head;
        while current != nil {
            if current!.index == index {
                current?.pre?.next = current?.next;
                current?.next?.pre = current?.pre;
                current = nil;
                print("删除第\(index)个节点成功");
                return true;
            }
            current = current?.next
        }
        print("删除失败");
        return false;
    }
}


class MergeLinkList<T:Comparable>: NSObject {
    func mergeSort(linkList:ExerciseLinkList<T>,L:Int,R:Int)  {
        if L >= R {
            return;
        }
        let M = (L + R)/2;
        mergeSort(linkList: linkList, L: L, R: M);
        mergeSort(linkList: linkList, L: M+1, R: R)
        merge(linkList:linkList,L:L,M:M,R:R);
    }
    
    func merge(linkList:ExerciseLinkList<T>,L:Int,M:Int,R:Int) {
        //copy LinkList
        let copyLinkList = ExerciseLinkList<T>();
        var current = linkList.objectAtIndex(index: L);
        while current != nil && current?.next?.index != R+2 {
            copyLinkList.append(value: (current?.value)!);
            current = current?.next
        }
        
        //merge
        current = linkList.objectAtIndex(index: L);
        var ls = copyLinkList.head;
        var rs = copyLinkList.objectAtIndex(index: M - L + 1)
        let rightBegin = rs;

        while current != nil && current?.next?.index != R + 2 {
            if rs == nil{
                current?.value = ls!.value
                ls = ls?.next
            }else if(rightBegin?.index! == ls?.index){
                current?.value = rs!.value
                rs = rs?.next
            }else if ls!.value < rs!.value {
                current!.value = ls!.value;
                ls = ls?.next;
            }else {
                current!.value = rs!.value;
                rs = rs!.next;
            }
            current = current?.next;
        }
    }
    
}

//2017年6月26日
class ExerciseQuickSort:BaseSort{
    override func sortArray<T>(_ array: inout [T]) where T : Comparable {
        quickSort(array: &array, L: 0, R: array.count - 1)
    }
    
    func quickSort<T:Comparable>(array:inout [T],L:Int,R:Int) {
        if L >= R {
            return
        }
        let currentIndex = partion(array: &array,L:L,R:R);
        quickSort(array: &array, L: L, R: currentIndex - 1)
        quickSort(array: &array, L: currentIndex + 1, R: R);
    }
    
    func partion<T:Comparable>(array:inout [T],L:Int,R:Int) -> Int {
        //随机数范围 0..<upperbound
        let randomIndex = Int(arc4random_uniform(UInt32(R-L+1))) + L
        //改变位置到数组开始
        var temp = array[L];
        array[L] = array[randomIndex];
        array[randomIndex] = temp;
        
        let e = array[L]
        var i = L+1;
        var j = R;
        while true {
            while i <= R && array[i] < e {
                i += 1;
            }
            while j > L && array[j] > e {
                j -= 1;
            }
            if(j < i){
                break;
            }
            let temp = array[i];
            array[i] = array[j];
            array[j] = temp;
            j -= 1
            i += 1
        }
        
        temp = array[L];
        array[L] = array[j];
        array[j] = temp;
        
        return j;
    }
}







