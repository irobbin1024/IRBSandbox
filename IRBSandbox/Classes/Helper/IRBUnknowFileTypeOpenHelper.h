//
//  IRBUnknowFileTypeOpenHelper.h
//  IRBSandbox
//
//  Created by irobbin on 2019/2/24.
//

#import <Foundation/Foundation.h>

@class IRBSandboxItem;

NS_ASSUME_NONNULL_BEGIN

@interface IRBUnknowFileTypeOpenHelper : NSObject

+ (void)showUnknowFileTypeOpenMenuWithItem:(IRBSandboxItem *)item
                            viewController:(UIViewController *)viewController
                            additionAction:(nullable NSArray<UIAlertAction *> *)additionAction;

@end

NS_ASSUME_NONNULL_END
