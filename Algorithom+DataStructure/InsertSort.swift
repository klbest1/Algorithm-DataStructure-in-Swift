//
//  InsertSort.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 8/05/2017.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

class InsertSort: BaseSort {
    override func sortArray<T : Comparable>(_ array:inout  [T]) {
        guard array.count > 0 else {
            return ;
        }
        
        for i in 1 ..< array.count{
            let temp = array[i];
            var j = i;
            //笔记：for 循环的变量不能被外部申明
            while j > 0 {
                if temp < array[j - 1] {
                    array[j] = array[j - 1];
                }else{
                    break;
                }
                j -= 1;
            }
            array[j] = temp;
        }
        
    }
    
    func sortArray<T:Comparable>(array: inout [T],L:Int, R:Int)  {
        guard array.count > 1 else {
            return ;
        }
        for i in L+1...R{
            var j = i;
            let temp = array[i]
            while j>L && temp < array[j-1]{
                array[j] = array[j-1];
                j -= 1;
            }
            array[j] = temp;
        }
    }
}
