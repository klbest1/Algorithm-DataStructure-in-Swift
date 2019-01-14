//
//  TestLeetCode.swift
//  Algorithom+DataStructure
//
//  Created by lin kang on 13/7/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

import UIKit

class TestLeetCode: NSObject {
    let leetCode = LeetCode();
    
    func test()  {
        let arrays = leetCode.getArraysOfAddsToTen();
        print("满足条件的是:");
        for ar in arrays{
            print("\(ar)")
        }
    }
}
