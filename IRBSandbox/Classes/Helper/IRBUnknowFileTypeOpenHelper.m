//
//  IRBUnknowFileTypeOpenHelper.m
//  IRBSandbox
//
//  Created by irobbin on 2019/2/24.
//

#import "IRBUnknowFileTypeOpenHelper.h"
#import "IRBSandboxItem.h"
#import "IRBFilePreviewViewController.h"
#import "IRBAirdropHelper.h"

@implementation IRBUnknowFileTypeOpenHelper

+ (void)showUnknowFileTypeOpenMenuWithItem:(IRBSandboxItem *)item
                            viewController:(UIViewController *)viewController
                            additionAction:(nullable NSArray<UIAlertAction *> *)additionAction {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"未知文件类型" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSArray<NSString *> * supportType = [IRBSandboxItem allSupportFileTypeNameList];
    [supportType enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [alertController addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"以%@打开", obj] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            IRBFilePreviewViewController * previewController = [IRBFilePreviewViewController new];
            previewController.forceFileType = [IRBSandboxItem fileTypeWithName:obj];
            previewController.item = item;
            
            [viewController.navigationController pushViewController:previewController animated:YES];
            
        }]];
    }];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Airdrop" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [IRBAirdropHelper airdropWithPath:item viewController:viewController];
        
    }]];
    
    [additionAction enumerateObjectsUsingBlock:^(UIAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [alertController addAction:obj];
    }];
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [viewController presentViewController:alertController animated:YES completion:nil];
}

@end
