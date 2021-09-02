//
//  ViewController.m
//  902UICollectionView
//
//  Created by 谢飞 on 2021/9/1.
//

#import "ViewController.h"
#import "SNBViewIcon.h"
#import "XFView.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *icons;
@property (nonatomic, strong) UIView *myView;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)icons
{
    if (_icons == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"viewicon.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            SNBViewIcon *model = [SNBViewIcon iconWithDict:dict];
            [arrayModels addObject:model];
        }
        _icons = arrayModels;
    }
    return _icons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 375, 800)];
    
    XFView *xiefei = [[XFView alloc] initWithFrame:CGRectMake(0, 0, 375, 88)];
    xiefei.backgroundColor = [UIColor whiteColor];
    [xiefei dataBinding:self.icons];
    
    xiefei.didSeleted = ^(NSInteger selectedIndex) {
        NSLog(@"%tu",selectedIndex);
    };
    
    
    [self.myView addSubview:xiefei];
    [self.view addSubview:self.myView];
    // Do any additional setup after loading the view.
}

@end
