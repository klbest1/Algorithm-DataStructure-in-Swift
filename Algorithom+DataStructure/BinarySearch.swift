//
//  BinarySearch.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 22/6/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

class BinarySearch<T:Comparable>: NSObject {
    
    func binarySearch(array:inout [T],v:T,L:Int,R:Int) -> Int {
        if L>=R {
            return -1
        }
        let M:Int = L + (R-L)/2
        if array[M] == v {
            return M;
        }else if(array[M] > v){
            return binarySearch(array: &array, v: v, L: L, R: M - 1)
        }else {
            return binarySearch(array: &array, v: v, L: M+1, R: R)
        }
    }
    
    func binarySearchFloor(array:inout [T],v:T,L:Int,R:Int) -> Int {
        if L>=R {
            if array[L] > v {
                return L-1
            }else{
                return L
            }
        }
        let M:Int = L + (R-L)/2
        if array[M] == v {
            for i in (0..<M).reversed(){
                let value = array[i]
                if value < v {
                    return i;
                }
            }
            return -1;
        }else if(array[M] > v){
            return binarySearchFloor(array: &array, v: v, L: L, R: M - 1)
        }else {
            return binarySearchFloor(array: &array, v: v, L: M+1, R: R)
        }
    
    }
}
