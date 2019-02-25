//
//  IRBFilePreviewFactory.m
//  IRBSandbox
//
//  Created by irobbin on 2019/2/16.
//

#import "IRBFilePreviewFactory.h"
#import "IRBSandboxItem.h"
#import "IRBTextTypeFilePreviewView.h"
#import "IRBImageTypeFilePreviewView.h"
#import "IRBWebTypeFilePreviewView.h"
#import "IRBVideoTypeFilePreviewView.h"

@implementation IRBFilePreviewFactory

+ (UIView<IRBFilePreviewProtocol> *)previewWithItem:(IRBSandboxItem *)item forceFileType:(IRBSandboxItemSubtype)forceFileType {
    if (item.type != IRBSandboxItemFile) {
        return nil;
    }
    
    IRBSandboxItemSubtype fileType = item.subtype;
    
    if (forceFileType != IRBSandboxItemSubtypeUnknow) {
        fileType = forceFileType;
    }
    
    UIView<IRBFilePreviewProtocol> * previewView = nil;
    
    switch (fileType) {
        case IRBSandboxItemSubtypeText:
            previewView = [IRBTextTypeFilePreviewView new];
            break;
        case IRBSandboxItemSubtypeImage:
            previewView = [IRBImageTypeFilePreviewView new];
            break;
        case IRBSandboxItemSubtypeHTML:
            previewView = [IRBWebTypeFilePreviewView new];
            break;
        case IRBSandboxItemSubtypeVideo:
        case IRBSandboxItemSubtypeAudio:
            previewView = [IRBVideoTypeFilePreviewView new];
            break;
            
            
        default:
            break;
    }
    
    [previewView setupWithItem:item];
    return previewView;
}

@end
