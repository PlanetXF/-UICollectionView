//
//  XFView.h
//  902UICollectionView
//
//  Created by 谢飞 on 2021/9/1.
//

#import <UIKit/UIKit.h>
#import "SNBViewIcon.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^SNBViewCellSelectedBlock)(NSInteger selectedIndex);

@interface XFView : UIView

@property (nonatomic, strong, readonly) UICollectionView *collectionView;

@property (nonatomic, strong) SNBViewCellSelectedBlock didSeleted;

- (void)dataBinding:(NSArray *)binding;

- (void)setItemCounts:(NSInteger *)itemCounts;

@end

NS_ASSUME_NONNULL_END
