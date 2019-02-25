//
//  IRBFilePreviewProtocol.h
//  IRBSandbox
//
//  Created by irobbin on 2019/2/17.
//

#ifndef IRBFilePreviewProtocol_h
#define IRBFilePreviewProtocol_h

@class IRBSandboxItem;

@protocol IRBFilePreviewProtocol <NSObject>

@required
- (void)setupWithItem:(IRBSandboxItem *)item;

@optional
- (NSArray<UIAlertAction *> *)additionActions;
@property (nonatomic, weak) UIViewController * fatherViewController;

@end

#endif /* IRBFilePreviewProtocol_h */
