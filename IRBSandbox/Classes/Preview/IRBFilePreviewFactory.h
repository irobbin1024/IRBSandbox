//
//  IRBFilePreviewFactory.h
//  IRBSandbox
//
//  Created by irobbin on 2019/2/16.
//

#import <Foundation/Foundation.h>
#import "IRBSandboxItem.h"
#import "IRBFilePreviewProtocol.h"

@import UIKit;


NS_ASSUME_NONNULL_BEGIN

@interface IRBFilePreviewFactory : NSObject

+ (UIView<IRBFilePreviewProtocol> *)previewWithItem:(IRBSandboxItem *)item forceFileType:(IRBSandboxItemSubtype)forceFileType;

@end

NS_ASSUME_NONNULL_END
