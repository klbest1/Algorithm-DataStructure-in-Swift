//
//  LeetCode.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 3/7/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

class LeetCode: NSObject {
    //2017年0703
    func maximumProduct(_ nums: [Int]) -> Int {
        
        //让逻辑每个都执行一次的方法就是，让最大数等于最小的，最小的等于最大的即可
        var max1 = -1000;
        var max2 = -1000;
        var max3 = -1000;
        var min1 = 1000
        var min2 = 1000;
        for i in 0..<nums.count{
            let num = nums[i]
            if(min1 > num){
                min2 = min1
                min1 = num;
            }else if(min2 > num){
                min2 = num
            }
            
            if(max1 < num ){
                max3 = max2;
                max2 = max1;
                max1 = num;
            }else if(max2 < num){
                max3 = max2
                max2 = num;
            }else if(max3 < num){
                max3 = num
            }
        }
        
        let production = max(min1*min2*max1,max1*max2*max3)
        return production
    }
    
    // a[0,1,2,3,4,5,6,7,8,9]
    // b[6,2,1,0,0,0,1,0,0,0]
    
    func getArraysOfAddsToTen() -> [[Int]] {
        
        var arraysToTen = [[Int]]()
        for i in 0..<10{
            var numbersToTen = Array(repeating: 0, count: 10)
            let numbersSets = NSCountedSet()
            numbersToTen[0] = i;
            numbersSets.add(i);
            
            for j in 0..<10{
                if(i+j > 10){
                    break;
                }
                numbersToTen[1] = j;
                numbersSets.add(j);
                for k in 0..<10{
                    if(i+j+k > 10){
                        break;
                    }
                    numbersToTen[2] = k;
                    numbersSets.add(k);
                    for l in 0..<10{
                        if(i+j+k+l > 10){
                            break;
                        }
                        numbersToTen[3] = l;
                        numbersSets.add(l);

                        for m in 0..<10{
                            if(i+j+k+l+m > 10){
                                break;
                            }
                            numbersToTen[4] = m;
                            numbersSets.add(m);

                            for n in 0..<10{
                                if(i+j+k+l+m+n > 10){
                                    break;
                                }
                                numbersToTen[5] = n;
                                numbersSets.add(n);

                                for o in 0..<10{
                                    if(i+j+k+l+m+n+o > 10){
                                        break;
                                    }
                                    numbersToTen[6] = o;
                                    numbersSets.add(o);

                                    for p in 0..<10{
                                        if(i+j+k+l+m+n+o+p > 10){
                                            break;
                                        }
                                        numbersToTen[7] = p;
                                        numbersSets.add(p);

                                        for q in 0..<10{
                                            if(i+j+k+l+m+n+o+p+q > 10){
                                                break;
                                            }
                                            numbersToTen[8] = q;
                                            numbersSets.add(q);

                                            for r in 0..<10{
                                                if(i+j+k+l+m+n+o+p+q+r > 10){
                                                    break;
                                                }
                                                numbersToTen[9] = r;
                                                numbersSets.add(r);

                                                if(i+j+k+l+m+n+o+p+q+r == 10 && checkTimesEqual(array: numbersToTen, countedSet: numbersSets)){
                                                    arraysToTen.append(numbersToTen);
                                                }else{
                                                    numbersSets.remove(r)
                                                }
                                            }
                                            numbersSets.remove(q)
                                        }
                                        numbersSets.remove(p)
                                    }
                                    numbersSets.remove(o)
                                }
                                numbersSets.remove(n)
                            }
                            numbersSets.remove(m)
                        }
                        numbersSets.remove(l)
                    }
                    numbersSets.remove(k)
                }
                numbersSets.remove(j)
            }
            numbersSets.remove(i)
        }
        
        return arraysToTen;
    }
    
    func checkTimesEqual(array:[Int],countedSet:NSCountedSet) -> Bool {
        for i in 0..<array.count{
            let times = array[i];
            let realTimes = countedSet.count(for: i);
            if times != realTimes {
                return false;
            }
        }
        return true;
    }
}
