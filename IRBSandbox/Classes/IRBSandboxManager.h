//
//  IRBSandboxManager.h
//  IRBSandbox
//
//  Created by robbin on 2019/2/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRBSandboxManager : NSObject

+ (instancetype)sharedInstance;

/**
 主动显示IRBSandbox
 */
- (void)show;

/**
 主动隐藏IRBSandbox
 */
- (void)hide;

/**
 启用侧滑开启IRBSandbox
 */
- (void)enable;


@end

NS_ASSUME_NONNULL_END
