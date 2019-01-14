//
//  Queue.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 28/6/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

//实现方法:泛型，插入，popFront,
private class QueueNode<T>{
    var value:T?
    var next:QueueNode?
    
    init(value:T) {
        self.value = value;
    }
}

class Queue<T>: NSObject {
    fileprivate var head:QueueNode<T>?
    fileprivate var tail:QueueNode<T>?
    var count:Int = 0;
}

extension Queue{
    func  append(value:T)  {
        let node = QueueNode(value: value);
        node.next = nil;
        count += 1;
        
        if let tempTail = self.tail {
            tempTail.next = node;
        }else{
            head = node;
        }
        tail = node;
    }
    
    func popFront() -> T? {
        let node = head;
        head = head?.next
        count -= 1;
        
        if head == nil {
            count = 0;
            tail = nil;
        }
        return node?.value;
    }
}
