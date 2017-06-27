//
//  SelectSort.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 7/05/2017.
//  Copyright © 2017 lin kang. All rights reserved.
//

//: Playground - noun: a place where people can play

import UIKit

//具体应用
struct Student:Comparable,Equatable{
    var name:String
    var score:Int
}

func <(lhs: Student, rhs: Student) -> Bool{
    return lhs.score < rhs.score;
}

func ==(lhs: Student, rhs: Student) -> Bool{
    return lhs.score == rhs.score;
}

class SelectSort:BaseSort {
    
    var str = "Hello, playground"
    
     override func sortArray<T:Comparable>(_ array:inout [T]){
        for i in 0..<array.count{
            var minIndex = i;
            var minNumber = array[i];
            
            for j in i+1..<array.count{
                if(array[j] < minNumber){
                    minNumber = array[j];
                    minIndex = j;
                }
            }
//            print("i = \(i),miniNumber = \(minNumber),index:\(minIndex)");
            
            let temp = array[i];
            array[i] = array[minIndex];
            array[minIndex] = temp;
        }
        
       
    }
    
}













