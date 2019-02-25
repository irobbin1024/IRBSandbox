//
//  IRBFileSystemHelper.h
//  IRBSandbox
//
//  Created by irobbin on 2019/2/24.
//

#import <Foundation/Foundation.h>
@class IRBSandboxItem;
NS_ASSUME_NONNULL_BEGIN

@interface IRBFileSystemHelper : NSObject

+ (void)deleteFileWithItem:(IRBSandboxItem *)item viewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
