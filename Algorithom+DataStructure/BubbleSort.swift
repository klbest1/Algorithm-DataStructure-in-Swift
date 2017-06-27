//
//  BubbleSort.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 8/05/2017.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit
//排序感受:把最小的排前面即可。
class BubbleSort: BaseSort {

    override func sortArray<T:Comparable>(_ array: inout [T]) {
        guard array.count > 1 else {
            return
        }
        
        for i in 0..<array.count{
            //0.0029  优化前，优化后,0.0021
            let temp = array[i];
            var finalIndex = i;
            for j in (i+1)..<array.count{
                if array[j] < array[i] {
                    array[i] = array[j];
                    finalIndex = j;
                }
            }
            array[finalIndex] = temp;
        }
    }
}
