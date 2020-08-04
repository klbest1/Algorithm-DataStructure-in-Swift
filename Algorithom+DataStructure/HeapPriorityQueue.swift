//
//  HeapPriorityQueue.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 2020/4/5.
//  Copyright © 2020 lin kang. All rights reserved.
//

import UIKit
import Foundation
//如何初始化泛型
//问题，如何传入一个比较函数？？？
   
//最小堆
class HeapPriorityQueue: NSObject {
    
    var count = 0;
    var capacity = 0;
    var a = [ListNode]() ;
    
     init(capacity:NSInteger){
        self.capacity = capacity;
        a.append(ListNode(0))
    }
    
    private func shiftUp(index:NSInteger){
        var i = index;
        while i/2 > 0 {
           let j = i/2;
            if a[j].val <= a[i].val {
                break;
            }
            if a[j].val > a[i].val{
                mySwap(a: &a,i: i,j: j)
            }
            i = j;
        }
    }
    
    func mySwap(a:inout [ListNode] ,i:NSInteger,j:NSInteger) {
        let tempNode = a[i];
        a[i] = a[j];
        a[j] = tempNode;
    }
    private func shitDown(index:NSInteger){
        var i = index;
        while 2*i < count + 1{
            var j = 2*i;
            if j+1 < count + 1 && a[j].val > a[j+1].val {
                j += 1;
            }
            
            if a[i].val <= a[j].val {
                break;
            }
            
            mySwap(a: &a,i: i,j: j)
            i = j;
        }
    }
    
    public func push(data:ListNode){
        a.append(data);
        count += 1;
        shiftUp(index: count)
    }
    
    public func extractValue()->ListNode?{
        if count == 0 {
            return nil;
        }
        let node:ListNode? = a[1] ;
        count -= 1;
        a[1] = a.last!;
        a.removeLast()
        shitDown(index: 1);
        return node;
    }
    
    public func isEmpty()->Bool{
        return count == 0
    }
    
    public func printHeap(){
        while !isEmpty(){
            if let node = extractValue(){
                print("\(node.val) |")
            }
            
        }
    }
}
