//
//  BinarySearchTree.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 23/6/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

class BinarySearchTree<Key:Comparable,Value:Comparable>: NSObject {

    private var count:Int = 0
    private var root:TreeNode?

    private class  TreeNode{
        var leftChild:TreeNode?
        var rightChild:TreeNode?
        var value:Value
        var key:Key
    
        init(key:Key,value:Value) {
            self.key = key;
            self.value = value;
        }
    }
    
    private func insert(treeRoot:TreeNode?,key:Key,value:Value)->TreeNode?{
      
        if let treeroot = treeRoot {
            if treeroot.key == key {
                treeroot.value = value;
            }else if(key < treeroot.key ){
                treeroot.leftChild =  insert(treeRoot: treeroot.leftChild, key: key, value: value)
            }else if(key > treeroot.key){
                treeroot.rightChild =  insert(treeRoot: treeroot.rightChild, key: key, value: value)
            }
        }else{
            count += 1;
            return TreeNode(key: key, value: value);
        }
        return treeRoot;
    }
    
    private func contain(node:TreeNode?, key:Key)->Bool{
        if node == nil {
            return false;
        }
        if node?.key == key {
            return true;
        }
        if key > node!.key {
           return contain(node: node!.rightChild!, key: key);
        }else{
            return contain(node: node!.leftChild, key: key);
        }
    }
    
    private func search(node:TreeNode? , key:Key)->Value?{
        if node == nil {
            return nil;
        }
        if node!.key == key {
            return node?.value
        }
        
        if key > node!.key  {
            return search(node: node?.rightChild, key: key)
        }else{
            return search(node: node?.leftChild, key: key);
        }

    }
    
    private func preSearch(node:TreeNode?){
        if node == nil {
            return;
        }
        
        print("前序位置\(node!.value)");
        preSearch(node: node!.leftChild);
        preSearch(node: node!.rightChild);
    }
    
    private func midleSearch(node:TreeNode?){
        if node == nil {
            return;
        }
        
        preSearch(node: node!.leftChild);
        print("中序位置\(node!.value)");
        preSearch(node: node!.rightChild);
    }
    
    private func postSearch(node:TreeNode?){
        if node == nil {
            return;
        }
        
        preSearch(node: node!.leftChild);
        preSearch(node: node!.rightChild);
        print("后序序位置\(node!.value)");
    }
    
    private func postSearchDestroy(node:inout TreeNode?){
        if node == nil {
            return;
        }
        
        preSearch(node: node!.leftChild);
        preSearch(node: node!.rightChild);
        print("后序序位置\(node!.value)");
        node = nil;
    }
    
    public func isEmpty() -> Bool {
        return count==0 ? true:false;
    }
    
    public func size() -> Int {
        return count;
    }
    
    public func insert(key:Key,value:Value){
        root =  insert(treeRoot: root, key: key, value: value)
    }
    
    public func contain(key:Key)->Bool{
        return contain(node: root, key: key)
    }
 
    public func search(key:Key)->Value?{
        return search(node: root, key: key)
    }
    
    public func preSearch(){
        preSearch(node: root)
    }
    
    public func destoryBST(){
        postSearchDestroy(node: &root)
    }
}
