//
//  TestLeetCode.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 13/7/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

class TestLeetCode: NSObject {
    let leetCode = LeetCode();
    
    func test()  {
//        let arrays = leetCode.getArraysOfAddsToTen();
//        print("满足条件的是:");
//        for ar in arrays{
//            print("\(ar)")
//        }
        
//        var lists:[ListNode?] = [ListNode?]()
//        var listOne:LinkedList = LinkedList()
//        listOne.append(value: 1)
//        listOne.append(value: 2)
//        listOne.append(value: 2)
//        lists.append(listOne.head)
//
//        listOne = LinkedList()
//        listOne.append(value: 1)
//        listOne.append(value: 1)
//        listOne.append(value: 2)
//        lists.append(listOne.head)
//
//        listOne = LinkedList()
//        listOne.append(value: 2)
//        listOne.append(value: 6)
//        lists.append(listOne.head)
        
//        let reuslt = leetCode.mergeKLists1(lists);
        
//       _ = leetCode.permute([1,2,3])
        
        _ = leetCode.solveNQueens(5);
    }
}
