//
//  IRBFilePreviewViewController.h
//  IRBSandbox
//
//  Created by irobbin on 2019/2/16.
//

#import <UIKit/UIKit.h>
#import "IRBSandboxItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface IRBFilePreviewViewController : UIViewController

@property (nonatomic, assign) IRBSandboxItemSubtype forceFileType;
@property (nonatomic, strong) IRBSandboxItem * item;

@end

NS_ASSUME_NONNULL_END
