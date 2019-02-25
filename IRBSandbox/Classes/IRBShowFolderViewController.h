//
//  IRBShowFolderViewController.h
//  IRBSandbox
//
//  Created by robbin on 2019/2/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRBShowFolderViewController : UITableViewController

@property (nonatomic, copy) NSString * rootFolderURL;

- (void)refreshData;

@end

NS_ASSUME_NONNULL_END
