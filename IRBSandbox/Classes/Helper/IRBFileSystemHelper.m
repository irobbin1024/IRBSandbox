//
//  IRBFileSystemHelper.m
//  IRBSandbox
//
//  Created by irobbin on 2019/2/24.
//

#import "IRBFileSystemHelper.h"
#import "IRBShowFolderViewController.h"
#import "IRBSandboxItem.h"

@implementation IRBFileSystemHelper

+ (void)forceDeleteFileWithItem:(IRBSandboxItem *)item viewController:(UIViewController *)viewController {
    NSError * error;
    [[NSFileManager defaultManager] removeItemAtPath:item.path error:&error];
    NSString * deleteTitle;
    NSString * deleteMessage;
    if (!error) {
        
        __block IRBShowFolderViewController * targetViewController = nil;
        [viewController.navigationController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (![obj isKindOfClass:IRBShowFolderViewController.class]) {
                *stop = YES;
            } else {
                targetViewController = (IRBShowFolderViewController *)obj;
            }
        }];
        
        [viewController.navigationController popToViewController:targetViewController animated:YES];
        [targetViewController refreshData];
        
        deleteMessage = @"删除成功";
    } else {
        deleteTitle = @"删除失败";
        deleteMessage = error.localizedDescription;
    }
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:deleteTitle message:deleteMessage preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil]];
    
    [viewController.navigationController presentViewController:alertController animated:YES completion:nil];
}

+ (void)deleteFileWithItem:(IRBSandboxItem *)item viewController:(UIViewController *)viewController {
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"是否删除：%@", item.name] message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self forceDeleteFileWithItem:item viewController:viewController];
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"放弃" style:UIAlertActionStyleCancel handler:nil]];
    
    [viewController presentViewController:alertController animated:YES completion:nil];
}

@end
