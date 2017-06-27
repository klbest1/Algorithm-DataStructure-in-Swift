//
//  HeapIndex.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 17/5/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit
//索引堆是用来 ，构建优先级的，不是用来排序的。
//索引作为ID来使用，
class HeapIndex<T:Comparable>: NSObject {
    private var indexes:[Int]!;
    private var reviseIndexes:[Int]!
    private var tasks:[T]!;
    private var capicity:Int!;
    var count:Int  = 0;
    
    init(capcity:Int ,type:T) {
        self.capicity = capcity;
        tasks = Array(repeating: type, count: capcity + 1);
        indexes = Array(repeating: 0, count: capcity + 1);
        reviseIndexes = Array(repeating: 0, count: capcity + 1)
    }
    
    func insert(index:Int,task:T) {
        guard index >= 0 && index < capicity! else {
            print("超出capicity\(String(describing: capicity))限制");
            return;
        }
        tasks[index + 1] = task;
        indexes[index + 1 ] = index + 1;
        reviseIndexes[index + 1] = index + 1;
        count += 1;
        shiftUp(index: index);
    }
    
    func isEmpty() ->Bool {
        return count <= 0
    }
    
    func shiftUp(index:Int) {
        var first = index + 1;
        while first > 1 {
            let parent = first/2;
            let leftChild = parent * 2
            let rightChild = leftChild + 1;
            
            var temp = parent;
            if leftChild < count + 1  && tasks[indexes[leftChild]] > tasks[indexes[temp]] {
                temp = leftChild;
            }
            
            if rightChild < count + 1  && tasks[indexes[rightChild]] > tasks[indexes[temp]] {
                temp = rightChild;
            }
            
            if parent == temp {
                return;
            }
            
            swap(&indexes[parent], &indexes[temp])
            reviseIndexes[indexes[parent]] = parent;
            reviseIndexes[indexes[temp]] = temp;
            first = parent;
        }
    }
    
    func shiftDown(index:Int)  {
        var parent = index + 1;
        while parent <= count/2  && parent > 0 {
            let leftChild = parent*2;
            let rightChild = leftChild + 1;
            var temp = parent;
            if leftChild < count + 1 && tasks[indexes[leftChild]] > tasks[indexes[parent]] {
                temp = leftChild;
            }
            
            if rightChild < count + 1 && tasks[indexes[rightChild]] > tasks[indexes[temp]]{
                temp = rightChild;
            }
            
            if temp == parent {
                return;
            }
            swap(&indexes[parent], &indexes[temp])
            reviseIndexes[indexes[parent]] = parent;
            reviseIndexes[indexes[temp]] = temp;
            parent = temp;
        }
    }
    
    func checkHeap()  {
        for n in indexes{
            print(n);
        }
    }
    
    func containsIndex(index:Int) -> Bool {
        guard index + 1 > 0 , index <= capicity else {
            print("不包含此索引\(index)");
            return false;
        }
        return reviseIndexes[index + 1] > 0
    }
    
    func changeValue(inIndex index:Int, value:T)  {
        guard containsIndex(index: index) else {
            return
        }
        
        let heapIndexInIndexes = reviseIndexes[index + 1] ;
        tasks[indexes[heapIndexInIndexes]] = value
        shiftDown(index: heapIndexInIndexes - 1);
        shiftUp(index: heapIndexInIndexes - 1);
        
    }
    
    func extractMax() -> T?{
        guard count > 0 else {
            return nil
        }
        let item = tasks[indexes[1]]
        if count > 1 {
            swap(&indexes[1], &indexes[count])
        }
        count -= 1;
        shiftDown(index: 0);
        return item;
    }
}
