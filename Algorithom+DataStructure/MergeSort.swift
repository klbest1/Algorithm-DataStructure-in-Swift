//
//  MergeSort.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 9/05/2017.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

//递归的执行顺序， 除了return 会返回上一层以外，函数执行完也会返回上一层,
//多次递归#A，#B 调用,核心：
//#A，#B执行完只有一种方式： return 结束条件时返回，
//每次递归都会有两个#A#B，只有#A执行完，才会执行#B
//最后一层递归返回上一层递归只有一种方式: 把函数执行完
/*举列子：  第一次运行代码到 #A 为第一层， #A开始产生递归（有限个#A,#B），
           执行顺序
           #A.....#An (n为递归次数)
           #An retun 执行#Bn  -->函数执行完毕，表示A(n-1)执行完毕, 执行#B(n-1),
           接着，A(n-2)执行完毕，执行#B(n-2)
           以此类推一直到#A执行完毕
         
           执行 #B， 函数执行完毕，
*/

// 一句话总结: 把 #A执行完，才会执行 #B, 从最后一层倒退回来。
// 递归会把所有满足条件的都列举出来

//--------------------------
//要点对数组的索引进行 分成两部分
class MergeSort: BaseSort {

    override func sortArray<T : Comparable>(_ array: inout [T]) {
        sortArrayReversed(array: &array);
    }
    
    
//    override func sortArray<T : Comparable>(_ array: inout [T]) {
//        func mergeSortArray<T :Comparable>(_ array:inout [T],L:Int,R:Int){
//            if( R - L <= 15 ){
//                let insertSort = InsertSort();
//                insertSort.sortArray(array: &array, L: L, R: R)
//                return;
//            }
//            
//            let middle = (R + L)/2;
//            //分开左部分
//            mergeSortArray(&array, L: L, R: middle) //#A
//            //分开右部分
//            mergeSortArray(&array, L: middle + 1, R: R);  //#B
//            merge(&array, L: L,middle:middle, R: R)
//            
//        }
//
//        mergeSortArray(&array, L: 0, R: array.count - 1)
//    }
    
    //合并
    func  merge<T:Comparable>(_ array:inout [T],L:Int,middle:Int,R:Int)  {
        //开辟临时空间，     //#B (剩余全部代码)
        var temp:[T] = [T]()
        for i in L...R{
            //                print("i-L:\(i)-\(L) ");
            //                temp[i-L] = array[i];
            temp.append(array[i])
        }
        
        var i = 0;
        var j = middle + 1 - L;
        //[L,middle] [middle + 1, R]
        //寻找左右两部分 谁更小， 放入 array[]中
        for k in L...R{
            if(i > middle - L){
                array[k] = temp[j];
                j += 1;
            }else if ( j > R - L){
                array[k] = temp[i];
                i += 1;
            }else if (temp[i] < temp[j]){
                array[k] = temp[i];
                i += 1;
            }else{
                array[k] = temp[j];
                j += 1;
            }
        }
    }
    
//    func mergeLinkedList<T>( linkList:LinkedList<T>,L:Int,Middle:Int,R:Int){
//        guard R > L ,Middle >= L,linkList.count > R  else {
//            return
//        }
//
//
//
////        tempList.nodeDescription();
////       print("-----------")
//        do {
//            //复制一份链表
//            let tempList = LinkedList<T>();
//            var current = try linkList.nodeAtIndex(index: L);
//            var tempCurrent = current;
//            for _ in L...R{
//                tempList.append(value: current!.value);
//                current = current?.next;
//            }
//
//            var currentLeft = try tempList.nodeAtIndex(index:0 )
//            var currentRight = try tempList.nodeAtIndex(index: Middle + 1 - L )
//            let nodeRightStart = currentRight;
//
//            current = tempCurrent;
//            tempCurrent = nil
//            //排序
//            for _ in L...R{
//                if currentRight == nil {
//                    current!.value = currentLeft!.value
//                    current = current?.next
//                    currentLeft = currentLeft!.next;
//                    //此处 next 被置空了，我日
//                }else if currentLeft === nodeRightStart {
//
//                    current!.value = currentRight!.value;
//                    current = current?.next
//                    currentRight = currentRight!.next;
//                }else if currentLeft!.value <= currentRight!.value {
//                    current!.value = currentLeft!.value
//                    currentLeft = currentLeft!.next;
//                    current = current!.next
//                }else{
//                    current!.value = currentRight!.value;
//                    current = current!.next;
//                    currentRight = currentRight!.next;
//                }
//            }
//
//        } catch  LinkListErro.outOfRange {
//            print("out of range");
//        } catch{
//            print("fuck");
//        }
//
//            }
    
//    func sortLinkList<T>(linkList:LinkedList<T>)  {
//        var size = 1;
//        let n = linkList.count;
//        while  size < n {
//            var i = 0;
//            while i + size - 1 < n {
//                mergeLinkedList(linkList: linkList, L: i, Middle: i + size - 1, R: min(i + size + size-1, n-1));
//                i += size + size ;
//            }
//            size += size;
//        }
//    }
    
    func sortArrayReversed<T:Comparable>(array:inout [T])  {
        var size = 1;
        let n = array.count;
        while  size < n {
            var i = 0;
            while i + size - 1 < array.count {
                merge(&array, L: i, middle: i + size-1, R: min(i + size + size-1, n-1));
                i += size + size ;
            }
            size += size;
        }
    }
    
    
}
