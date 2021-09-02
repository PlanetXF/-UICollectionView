//
//  XFView.m
//  902UICollectionView
//
//  Created by 谢飞 on 2021/9/1.
//

#import "XFView.h"
#import "SNBCollectionViewCell.h"

#define reuseIdentifier @"cellid"

@interface XFView () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) SNBCollectionViewCell *cell;

@property (nonatomic, strong, readwrite) UICollectionView *collectionView;

@property (nonatomic, assign) NSUInteger *numberOfItems;

@property (nonatomic, copy) NSArray *bindData;

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, assign) CGRect collectionViewSize;

@property (nonatomic, assign) NSInteger *itemCounts;

@end

@implementation XFView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.collectionViewSize = frame;
    }
    return self;
}

- (void)dataBinding:(NSArray *)binding
{
    self.numberOfItems = binding.count;
    self.bindData = binding;
    self.collectionView = [self collectionView];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    self.collectionView.backgroundColor = backgroundColor;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.collectionViewSize collectionViewLayout:layout];
        [self addSubview:_collectionView];
        
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[SNBCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    return _collectionView;
}

#pragma mark - datasource
//组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//一组的item个数
- (NSUInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (NSUInteger)self.numberOfItems;
}
//返回每个item
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //1.获取模型
    SNBViewIcon *model = self.bindData[indexPath.row];
    //2.创建item
    self.cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    self.cell.icon = model;
    //3.返回cell
    return self.cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSeleted) {
        self.didSeleted(indexPath.row);
    }
}

- (void)setItemCounts:(NSInteger *)itemCounts
{
    self.itemCounts = itemCounts;
}

//设置每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemW = collectionView.frame.size.width / 4;
    CGFloat itemH = collectionView.frame.size.height;
    return CGSizeMake(itemW, itemH);
}


@end
