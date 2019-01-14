//
//  BinarySearchTree.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 23/6/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

//把TreeNode放入BinarySearchTree 申明 会无提示的crash.......
private class  TreeNode<Key:Comparable,Value:Comparable>{
    var leftChild:TreeNode?
    var  rightChild:TreeNode?
    var value:Value
    var key:Key
    
    init(key:Key,value:Value) {
        self.key = key;
        self.value = value;
    }
}

class BinarySearchTree<Key:Comparable,Value:Comparable>: NSObject {

   
    private var count:Int = 0
    private  var root:TreeNode<Key,Value>?

    private func insert(treeRoot:TreeNode<Key,Value>?,key:Key,value:Value)-> TreeNode<Key,Value>?{
      
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
            let node = TreeNode(key: key, value: value);
            return node;
        }
        return treeRoot;
    }
    
    private func contain(node:TreeNode<Key,Value>?, key:Key)->Bool{
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
    
    private func search(node:TreeNode<Key,Value>? , key:Key)->Value?{
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
    
    /*......深度优先....*/
    private func preOrder(node:TreeNode<Key,Value>?){
        if node == nil {
            return;
        }
        
        print("前序位置\(node!.key)");
        preOrder(node: node!.leftChild);
        preOrder(node: node!.rightChild);
    }
    
    private func midleOrder(node:TreeNode<Key,Value>?){
        if node == nil {
            return;
        }
        
        midleOrder(node: node!.leftChild);
        print("中序位置\(node!.key)");
        midleOrder(node: node!.rightChild);
    }
    
    private func postOrder(node:TreeNode<Key,Value>?){
        if node == nil {
            return;
        }
        
        postOrder(node: node!.leftChild);
        postOrder(node: node!.rightChild);
        print("后序序位置\(node!.key)");
    }
    /*-------------------------*/
    /*------广度优先-------*/
    private func levelOrder(){
        let queue:Queue = Queue<TreeNode<Key,Value>>()
        queue.append(value: root!);
        
        while queue.count != 0 {
            let node  = queue.popFront()
            print("层级遍历:\(String(describing: node?.key))")
            if let leftChild = node?.leftChild {
                queue.append(value: leftChild)
            }
            if let rightChild = node?.rightChild {
                queue.append(value: rightChild);
            }
        }
    }
    
    private func postOrderDestroy(node:inout TreeNode<Key,Value>?){
        if node == nil {
            return;
        }
        
        postOrderDestroy(node: &node!.leftChild);
        postOrderDestroy(node: &node!.rightChild);
        print("后序序位置\(node!.value)");
        node = nil;
    }

    //最大值
    private func getMaxMumNode(treeNode:TreeNode<Key,Value>)->TreeNode<Key,Value>{
        if treeNode.rightChild == nil {
            return treeNode
        }
        return getMaxMumNode(treeNode: treeNode.rightChild!)
    }
    //最小值
    private func getMinimumNode(treeNode:TreeNode<Key,Value>)->TreeNode<Key,Value>{
        if treeNode.leftChild == nil{
            return treeNode
        }
        return getMinimumNode(treeNode: treeNode.leftChild!)
    }
    //删除最小值
    private func deleteMiniNode(node:inout TreeNode<Key,Value>?)->TreeNode<Key,Value>?{
        if node!.leftChild == nil {
            let rightNode = node!.rightChild;
            node = nil
            return rightNode;
        }
        
        node!.leftChild =  deleteMiniNode(node: &node!.leftChild)
        return  node;
    }
    //删除最大值
    private func deleteMaxNode(node:inout TreeNode<Key,Value>?)-> TreeNode<Key,Value>?{
        if node!.rightChild == nil{
            let leftNode = node!.leftChild
            node = nil;
            return leftNode
        }
        
        node!.rightChild =  deleteMaxNode(node: &node!.rightChild)
        return node;
    }
    
    //MARK: - 公有方法
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
        preOrder(node: root)
    }
    
    public func orderSearch(){
        levelOrder();
    }
    
    public func maxMumNumber()->Key?{
        guard root != nil else {
            return nil
        }
        let maxMumNode = getMaxMumNode(treeNode: root!);
        return maxMumNode.key
    }
    
    public func miniMumNumber()->Key?{
        guard root != nil else {
            return nil
        }
        let mimiMumNode = getMinimumNode(treeNode: root!);
        return mimiMumNode.key
    }
    
    public func deleteMiniNumber(){
        guard root != nil else {
            return
        }
        root = deleteMiniNode(node: &root)
    }
    
    public func deleteMaxNUmber(){
        guard root != nil else {
            return
        }
        root = deleteMaxNode(node: &root)
    }
    
    public func destoryBST(){
        postOrderDestroy(node: &root)
    }
}
