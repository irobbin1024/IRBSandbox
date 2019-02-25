//
//  IRBShowFolderTableViewCell.h
//  IRBSandbox
//
//  Created by irobbin on 2019/2/16.
//

#import <UIKit/UIKit.h>

@class IRBSandboxItem;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const kIRBShowFolderTableViewCellIdentifier;

@interface IRBShowFolderTableViewCell : UITableViewCell

@property (nonatomic, strong) IRBSandboxItem * item;

@property (nonatomic, strong) void(^longPressGestureCallback)(IRBSandboxItem * item);

@end

NS_ASSUME_NONNULL_END
