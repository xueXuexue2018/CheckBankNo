//
//  ViewController.m
//  checkCardNo
//
//  Created by juntuo on 2018/10/30.
//  Copyright © 2018 juntuo. All rights reserved.
//

#import "ViewController.h"
#import "CheckCardNoModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%s",[CheckCardNoModel checkCardNo:@"6212 2622 0102 3557 228"] ? "有效卡":"无效卡");

    NSLog(@"%@",[CheckCardNoModel getBankName:@"6212 2622 0102 3557 228"]);

}


@end
