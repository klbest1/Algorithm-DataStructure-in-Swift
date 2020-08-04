//
//  CImpletedAlgrithom.c
//  Algorithom+DataStructure
//
//  Created by lin kang on 21/6/17.
//  Copyright © 2017 lin kang. All rights reserved.
//

#include "CImpletedAlgrithom.h"


//2017 年 6月22日
int removeDuplicates(int A[], int n, int k) {
    k = 2;
    if (n <= k) return n;
    
    int i = 1, j = 1;
    int cnt = 1;
    while (j < n) {
        //不相等
        if (A[j] != A[j-1]) {
            cnt = 1;
            A[i] = A[j];
            i++;
        }
        else {
            if (cnt < k) {
//                A[i] = A[j];
                i++;
                cnt++;
            }
        }
        ++j;
    }
    printf("C语言!...");
    for (int i= 0; i<n; i++){
        printf("%d",A[i]);
    }
    return i;
}

void testFunc(){
    int array[4] = {1,1,3,4};
    removeDuplicates(array, 4, 2);
}
