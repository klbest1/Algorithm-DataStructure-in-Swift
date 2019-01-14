//
//  TestSort.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 7/05/2017.
//  Copyright © 2017 lin kang. All rights reserved.
//

import Foundation
class TestSort{
    //生成测试用例
    func getRandomArray(length:Int,rangeLeft:Int,rangeRight:Int)->Array<Int>{
        var array = [Int]();
        for _ in 0..<length{
            let number = Int(arc4random_uniform(UInt32(rangeRight) - UInt32(rangeLeft))) + rangeLeft
            array.append(number);
        }
        return array;
    }
    
    func getRandomLinkList(length:Int,rangeLeft:Int,rangeRight:Int)-> ExerciseLinkList<Int> {
        let linkList = ExerciseLinkList<Int>();
        for _ in 0..<length{
            let number = Int(arc4random_uniform(UInt32(rangeRight) - UInt32(rangeLeft))) + rangeLeft
            linkList.append(value: number);
        }
        
        return linkList;
    }
    
    func generateNearlyOrdedArray(length:Int,swichTime:Int) -> Array<Int> {
        var  array = [Int]();
        for i in 0..<length{
            array.append(i);
        }
        
        for _ in  0..<swichTime{
           let switchIndexFirst = Int(arc4random_uniform(UInt32(length/2)))
           let switchIndexSecond = Int(arc4random_uniform(UInt32(length/2))) + length/2
           
            swap(&array[switchIndexFirst], &array[switchIndexSecond]);
        }
        return array;
    }
    
    func getOrderedKeys(length:Int) -> Array<Int> {
        var array = [Int]()
        for i in 0..<length{
            array.append(i);
        }
        return array;
    }
    
    func printTime(sortTypeName:String, timeBegin:Date,timeFinish:Date)  {
        let timeStr = String(format: "%.4f", timeFinish.timeIntervalSince(timeBegin));
        print("\(sortTypeName)-->cost Time \(timeStr)s");
    }
    
    
    func  testLinkedList()  {
        let mergeSortObject = MergeLinkList<Int>();
        let linkList = getRandomLinkList(length: 20, rangeLeft: 1, rangeRight: 200);
        printLinkList(linkList: linkList);
        _ = linkList.deleteObjectAtIndex(index: 19)
        printLinkList(linkList: linkList);
        let node = linkList.objectAtIndex(index: 3);
        print("获取到的节点值为:\(String(describing: node?.value))");
        
        print("归并排序:");
        mergeSortObject.mergeSort(linkList: linkList, L: 0, R: linkList.count - 1);
        printLinkList(linkList: linkList);
    }
    
    func printLinkList<T:Comparable>(linkList:ExerciseLinkList<T>)  {
        var current = linkList.head;
        print("开始打印链表:")
        while  current != nil{
            let value = current?.value;
            print(value ?? "无值");
            current = current?.next;
        }
    }
    
    func testSort<T:Comparable>(sortTypeName:String, sortObject:BaseSort, array:inout [T]) {
        
        let timeBegin = Date();
        sortObject.sortArray(&array)
        let timeFinish = Date();
        
        for i in 0..<(array.count-1){
            if array[i]>array[i + 1] {
                print("没有排序成功! Number:\(array[i])");
                return;
//                break;
            }
        }
        printTime(sortTypeName: sortTypeName, timeBegin: timeBegin, timeFinish: timeFinish);
        for number in array{
            print(number);
        }
    }
    
    func testHeapIndex() {
        let heapIndex = HeapIndex<Int>(capcity: 10, type:0);
        let numbers = [24,20,30,40,50,42,70,20,11,23];
        for i in 0..<numbers.count{
            let number = numbers[i]
            heapIndex.insert(index: i, task: number);
        }
        
        // heapIndex.checkHeap();
        heapIndex.changeValue(inIndex: 1, value: 21);
        
        while !heapIndex.isEmpty() {
            print(heapIndex.extractMax() ?? "null");
        }
    }
    
    func testHeapChoseLimtedNumber()  {
        let chosingHeap = HeapForChosingNumberInGroup(withCapicity: 10, type: 0);
//        let numbers = [24,20,30,40,50,42,70,20,11,23];
        let numbers = getRandomArray(length: 100, rangeLeft: 1, rangeRight: 10000);
        var copyNumbers = [] + numbers;
        for i in 0..<numbers.count{
            let number = numbers[i]
            chosingHeap.insertNumber(value: number);
        }
        
        print("#---- 二叉树选择前10个...");
        while !chosingHeap.isEmpty() {
            print(chosingHeap.extractMin() ?? "null");
        }
        
        print("排序对比");
        let mergeSortObject = MergeSort();
        mergeSortObject.sortArray(&copyNumbers);
        for number in copyNumbers{
            print(number);
        }
    }
    
    func testBinarySearchTree()  {
        let keys = getRandomArray(length: 10, rangeLeft: 10, rangeRight: 100);
        let array = getOrderedKeys(length: 10);
        let binarTree = BinarySearchTree<Int,Int>()
        //插入
        for i in 0..<keys.count{
            let key = keys[i];
            let value = array[i];
            binarTree.insert(key: key, value: value);
        }
        //搜索
        let value = binarTree.search(key: 4);
        print("搜索“4”的value值为:\(String(describing: value))")
        //遍历
        //
        binarTree.orderSearch();
        print("前序遍历")
        binarTree.preSearch()
        print("找最大值\(String(describing: binarTree.maxMumNumber()))")
        print("找最小值\(String(describing: binarTree.miniMumNumber()))")
        print("删除最小值")
        binarTree.deleteMiniNumber()
        print("删除最大值")
        binarTree.deleteMaxNUmber()
        print("再次遍历")
        binarTree.orderSearch();
    }
}
