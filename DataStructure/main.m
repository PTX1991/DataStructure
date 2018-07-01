//
//  main.m
//  DataStructure
//
//  Created by 潘天乡 on 01/07/2018.
//  Copyright © 2018 PTX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

typedef char ElementType;
typedef struct BinNode {
    ElementType data;
    struct BinNode  *LChild, *RChild;
}BinNode, *BinTree;

BinTree createBinTree(void);

int main(int argc, char * argv[]) {
    BinTree binTree = createBinTree();
    
    return 1;
}


#pragma mark - Binary tree
BinTree createBinTree() {
    ElementType datasource[11] = {'A','B',',',',','C',',',',',',',',','D','#'}; //需要按完全二叉树的结构来构建二叉链表，‘,'代表空结点,'#'代表结束
    int dataIndex = 0;
    BinTree q[11]; //队列q存放结点
    BinTree root = NULL, current = NULL; //root代表跟结点，current代表当前操作的结点
    int father = 1, rear = 0; //father代表父结点，rear代表队列q的尾结点
    while (datasource[dataIndex] != '#') {
        rear++;
        current = NULL;
        if (datasource[dataIndex] != ',') {
            current = (BinNode *)malloc(sizeof(BinNode));
            current->data = datasource[dataIndex];
            current->LChild = NULL;
            current->RChild = NULL;
        }
        q[rear] = current;
        if (rear == 1 && current != NULL) {
            root = current;
        }else {
            if (current != NULL && q[father] != NULL) {
                if (rear % 2 == 0) { //左孩子
                    q[father]->LChild = current;
                }else if (rear % 2 == 1){ //右孩子
                    q[father]->RChild = current;
                }
            }
            if (rear % 2 == 1) {
                father++; //father指向下一个父结点
            }
        }
        
        dataIndex++; //指向下一个输入源
    }
    return root;
}
