//
//  LinkedList.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 11/05/2017.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit
//public  模块外import时可以调用
//var 默认internal level ，整个程序APP都可以访问
//链表，堆和栈。

//public class Node<T:Comparable> {
//    var value:T;
//    var next: Node<T>?
//
//    init(value:T) {
//        self.value = value;
//    }
//
//}

//func <(lhs: Node<T: Comparable>, rhs: Node<T: Comparable>) -> Bool{
//    return ;
//}



enum LinkListErro:Error{
    case outOfRange
}
//要实现的方法:append,printing,objectAtIndex,removeAtIndex,
public class LinkedList {
 
    var head:ListNode?
    var tail:ListNode?
    var count:Int = 0;

    public func append(value:NSInteger) {
        let newNode = ListNode(value);
        count +=  1;
        if let tailNode = tail {
            tailNode.next = newNode;
            newNode.next = nil;
        }else{
            head = newNode;
        }
        tail = newNode;
    }
    
    public func nodeAtIndex(index:Int) throws -> ListNode?{
        guard index < count,index >= 0  else {
            return nil;
        }
        
        var current = head;
        for _ in 0..<index{
            current = current?.next;
        }
        
        return current;
    }
    
    public func removeAtIndex(index:Int) throws {
        guard index < count - 1,index > 0  else {
            throw LinkListErro.outOfRange
        }
        
        if index == 0 {
            var temp = head;
            head = head?.next;
            
            temp?.next = nil;
            temp = nil;
            return;
        }
        
        var current = head;
        var i = 1;
        while i < index-1 {
            current = current?.next;
            i += 1;
        }
        
        var temp = current?.next;
        let thirdNode = temp?.next;
        current?.next = thirdNode;
        temp!.next = nil;
        temp = nil;
    }
    
//    public func nodeDescription(){
//        var current = head;
//        while current != nil {
//            print("value:\(current!.value)\n")
//            if let next = current!.next {
//                if next.value < current!.value {
//                    print("没有排好序！！")
//                    break;
//                }
//            }
//            current = current?.next;
//        }
//    }
}
