//
//  IRBAirdropHelper.h
//  IRBSandbox
//
//  Created by irobbin on 2019/2/19.
//

#import <Foundation/Foundation.h>

@class IRBSandboxItem;

NS_ASSUME_NONNULL_BEGIN

@interface IRBAirdropHelper : NSObject

+ (void)airdropWithPath:(IRBSandboxItem *)item viewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
