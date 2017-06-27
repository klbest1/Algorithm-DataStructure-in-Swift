//
//  ViewController.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 7/05/2017.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let testSort = TestSort();
        
        // Do any additional setup after loading the view, typically from a nib.
        let st = Student(name: "A", score: 87);
        let st1 = Student(name: "B", score: 83);
        let st2 = Student(name: "A", score: 75);
        let st3 = Student(name: "A", score: 57);
        var students = [st,st1,st2,st3];
        
        let sortObject = SelectSort();
        let insertSortObject = InsertSort();
        let bubleSortObject = BubbleSort();
        let mergeSortObject = MergeSort();
        let heapSortObject = Heap();
        let quickSortObject = QuickSort();
        let exerciseMergeObject = ExerciseMergeSort()
        
        var testNumbers = testSort.getRandomArray(length: 1000, rangeLeft: 0, rangeRight: 500);
        var copyTestNumbers = [] + testNumbers;
        var copyTestNumbers1 = [] + testNumbers;
        var copyTestNumbers2 = [] + testNumbers;
        var copyTestNumbers3 = [] + testNumbers;
        var copyTestNumbers4 = [] + testNumbers;
        var copyTestNumbers5 = [] + testNumbers;
//
//      testSort.testSort(sortTypeName: "SelectSort",sortObject:sortObject, array: &students);
//      testSort.testSort(sortTypeName: "SelectSort",sortObject:sortObject, array: &testNumbers);
//      testSort.testSort(sortTypeName: "InsertSort", sortObject: insertSortObject, array: &copyTestNumbers)
//      testSort.testSort(sortTypeName: "BubleSort", sortObject: bubleSortObject, array: &copyTestNumbers1);
//      testSort.testSort(sortTypeName: "MergeSort", sortObject: mergeSortObject, array: &copyTestNumbers2);
//      testSort.testSort(sortTypeName: "HeapSort", sortObject: heapSortObject, array: &copyTestNumbers3);
//      testSort.testSort(sortTypeName: "QuickSort", sortObject: quickSortObject, array: &copyTestNumbers4)
//      testSort.testSort(sortTypeName: "ExerciseMergeSort", sortObject: exerciseMergeObject, array: &copyTestNumbers5)
 
        //查找
        //1.二分查找
//        let binarySearch = BinarySearch<Int>()
//        let numerIndex = binarySearch.binarySearchFloor(array: &testNumbers, v: 300, L: 0, R: testNumbers.count-1)
//        print("查找结果:\(numerIndex)");
        
        //
         //测试递归执行顺序
         //        getresult(len: 1);
         //测试链表
//                 testSort.testLinkedList();
         //测试堆
         
         //        print("####----------####")
         //        testSort.testHeapChoseLimtedNumber();
         
//        //练习排序算法
//        let exeSelect = ExerciseForSelectSort<Int>();
//        let exeInsertSort = ExerciseForSelectSort<Int>();
//        let exeMergeSort = ExerciseForMergeSort();
        let exeQuickSort = ExerciseQuickSort();
        var testExeNumbers = testSort.getRandomArray(length: 100, rangeLeft: 0, rangeRight: 500);
//        testSort.testSort(sortTypeName: "选择排序", sortObject: exeSelect, array: &testExeNumbers);
//        testSort.testSort(sortTypeName: "插入排序", sortObject: exeInsertSort, array: &testExeNumbers);
//        testSort.testSort(sortTypeName: "归并排序", sortObject: exeMergeSort, array: &testExeNumbers);
        testSort.testSort(sortTypeName: "快速排序", sortObject: exeQuickSort, array: &testExeNumbers)
        testFunc();
    }
    

    public class TestNode{
        var value:Int = 0;
        var next:TestNode?
        init(value:Int) {
            self.value = value;
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let n = 4;
    var result = 0;
    var len = 0;

    func  getresult( len:Int){
     
        if(len == n)
        {
            result += 1;
            return ;
        }
        if(len > n){
            return;
        }
        print("\(len) + 1");
        getresult(len: len + 1);  //#1
        print("\(len) + 2");
        getresult(len: len+2); //#2
    }

}

