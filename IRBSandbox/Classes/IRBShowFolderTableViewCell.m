//
//  IRBShowFolderTableViewCell.m
//  IRBSandbox
//
//  Created by irobbin on 2019/2/16.
//

#import "IRBShowFolderTableViewCell.h"

NSString * const kIRBShowFolderTableViewCellIdentifier = @"kIRBShowFolderTableViewCellIdentifier";

@implementation IRBShowFolderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILongPressGestureRecognizer * gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureAction:)];

        [self.contentView addGestureRecognizer:gesture];
    }
    return self;
}

- (void)longPressGestureAction:(UILongPressGestureRecognizer *)sender {
    if (sender.state != UIGestureRecognizerStateBegan) {
        return ;
    }
    if (self.longPressGestureCallback) {
        self.longPressGestureCallback(self.item);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
