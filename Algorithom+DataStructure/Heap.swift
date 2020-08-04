//
//  Heap.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 15/5/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

// 分配空间， insert, empty, count
class Heap :BaseSort{
    var count:Int = 0;
    
    override func sortArray<T: Comparable>(_ array: inout [T]) {
        count = array.count;
        //构建堆
        for i in (0...(count - 1 - 1)/2).reversed(){
            shiftDown(&array, index: i)
        }
        //排序
        extractMax(array: &array);
    }
    

    func isEmpty() -> Bool {
        return count < 1
    }
    
    func insert<T:Comparable>(array:inout [T] ,value:T) {
        count += 1;
        array.append(value);
        shiftUp(&array, index:count-1)
    }

    func shiftDown<T:Comparable>(_ array:inout [T],index:Int){
        var parent = index;
        var temp = parent;
        while true {
            let leftChild = parent * 2 + 1;
            let rightChild = leftChild + 1;
            //找出最大的放在父节点那里
            if leftChild < count &&  array[leftChild] > array[temp]{
                temp = leftChild;
            }
            if  rightChild < count && array[rightChild] > array[temp]{
                temp = rightChild;
            }
            
            if temp == parent {
                return;
            }
            array.swapAt(parent, temp);
            parent = temp;
        }
    }
    
//    var heapArray = [0,16,52,30,5,22,13,41,19,17,15]

    func shiftUp<T:Comparable>(_ array:inout [T],index:Int)  {
        var first = index
        
        while first > 0 && first < count {
            let parent = (first-1)/2;
            let leftChild =  parent * 2 + 1
            let rightChild = leftChild + 1;
            
            var  maxNumber = parent;
            
            if leftChild < count && array[leftChild] > array[maxNumber] {
                maxNumber = leftChild;
            }
            if (rightChild < count && array[rightChild] > array[maxNumber]){
                maxNumber = rightChild;
            }
            
            if maxNumber == parent {
                return;
            }
            
            array.swapAt(parent, maxNumber);
            first = parent;
        }
    }
    
    func extractMax<T:Comparable>(array:inout [T]) {
        while count > 1 {
            array.swapAt(0, count - 1)
            count -= 1;
            shiftDown(&array, index: 0);
        }
    }
}
