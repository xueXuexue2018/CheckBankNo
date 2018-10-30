//
//  CheckCardNoModel.m
//  checkCardNo
//
//  Created by juntuo on 2018/10/30.
//  Copyright © 2018 juntuo. All rights reserved.
//

#import "CheckCardNoModel.h"

@implementation CheckCardNoModel
#pragma mark 校验银行卡
+(BOOL)checkCardNo:(NSString *)cardNo{

    int oddsum = 0;     //奇数求和
         int evensum = 0;    //偶数求和
         int allsum = 0;
        int cardNoLength = (int)[cardNo length];
         int lastNum = [[cardNo substringFromIndex:cardNoLength-1] intValue];

         cardNo = [cardNo substringToIndex:cardNoLength - 1];
         for (int i = cardNoLength -1 ; i>=1;i--) {
                 NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
                 int tmpVal = [tmpString intValue];
                if (cardNoLength % 2 ==1 ) {
                         if((i % 2) == 0){
                                 tmpVal *= 2;
                                 if(tmpVal>=10)
                                        tmpVal -= 9;
                                 evensum += tmpVal;
                             }else{
                                    oddsum += tmpVal;
                                 }
                     }else{
                             if((i % 2) == 1){
                                     tmpVal *= 2;
                                     if(tmpVal>=10)
                                             tmpVal -= 9;
                                     evensum += tmpVal;
                                 }else{
                                        oddsum += tmpVal;
                                     }
                        }
             }

         allsum = oddsum + evensum;
         allsum += lastNum;
         if((allsum % 10) == 0)
                 return YES;
         else
                 return NO;

}
#pragma mark 根据银行卡号判断银行名称
+ (NSString *)getBankName:(NSString*) cardId {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"BankModel" ofType:@"json"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    //发卡行.卡种名称
    NSArray *bankName = dict[@"bankName"];
    //BIN号
    NSArray* bankBin = dict[@"bankBin"];

    int index = -1;
    // 统一去掉空格,否则好像无法判断出银行卡名称
    cardId = [cardId stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (cardId == nil || cardId.length < 16 || cardId.length > 19) {
        return @"";
    }
    //6位Bin号
    NSString *cardbin_6 = [cardId substringWithRange:NSMakeRange(0, 6)];
    for (int i = 0; i < bankBin.count; i++) {
        if ([cardbin_6 isEqualToString:bankBin[i]]) {
            index = i;
        }
    }
    if (index != -1) {
        return bankName[index];
    }
    //8位Bin号
    NSString *cardbin_8 = [cardId substringWithRange:NSMakeRange(0, 8)];
    for (int i = 0; i < bankBin.count; i++) {
        if ([cardbin_8 isEqualToString:bankBin[i]]) {
            index = i;
        }
    }
    if (index != -1) {
        return bankName[index];
    }
    return @"";

}
@end
