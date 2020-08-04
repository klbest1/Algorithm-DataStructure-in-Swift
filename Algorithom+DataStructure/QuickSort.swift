//
//  QuickSort.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 26/5/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

class QuickSort: BaseSort {
    override func sortArray<T>(_ array: inout [T]) where T : Comparable {
        quickSort(array: &array, indexBegin: 0, indexEnd: array.count - 1)
    }
    
    func quickSort<T:Comparable>(array:inout [T],indexBegin:Int,indexEnd:Int)  {
        if indexBegin >= indexEnd {
            return;
        }
        let j = partion1(array: &array,indexBegin: indexBegin,indexEnd: indexEnd);
        quickSort(array: &array, indexBegin: indexBegin, indexEnd: j)
        quickSort(array: &array, indexBegin: j + 1, indexEnd: indexEnd)
    }
    
    func partion<T:Comparable>(array:inout [T],indexBegin:Int,indexEnd:Int) -> Int {
        let randomIndex = Int(arc4random_uniform(UInt32(indexEnd - indexBegin + 1))) + indexBegin
        if randomIndex != indexBegin {
            array.swapAt(indexBegin, randomIndex);
        }
        
        let fistNumber = array[indexBegin];
        var j = indexBegin;
        for i in (indexBegin + 1)...indexEnd{
            if array[i] < fistNumber  {
                let temp = array[j + 1];
                array[j + 1] = array[i];
                array[i] = temp;
                j += 1;
            }
        }
        
        let temp = array[indexBegin];
        array[indexBegin] = array[j];
        array[j] = temp;
        
        return j;
    }
    
    func partion1<T:Comparable>(array:inout [T],indexBegin:Int,indexEnd:Int) -> Int {
        let randomIndex = Int(arc4random_uniform(UInt32(indexEnd - indexBegin + 1))) + indexBegin
        if randomIndex != indexBegin {
            array.swapAt(indexBegin, randomIndex);
        }
        
        let fistNumber = array[indexBegin];
        var i = indexBegin + 1;
        var j = indexEnd;
        while true {
            while i <= indexEnd && array[i] < fistNumber {
                i += 1;
            }
            while j >= indexBegin && array[j] > fistNumber {
                j -= 1;
            }
            
            if i > j {
                break;
            }
            let temp = array[i];
            array[i] = array[j];
            array[j] = temp;
            i += 1;
            j -= 1;
        }
        let temp = array[indexBegin];
        array[indexBegin] = array[j];
        array[j] = temp;
        return j;
    }
}
