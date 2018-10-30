//
//  CheckCardNoModel.h
//  checkCardNo
//
//  Created by juntuo on 2018/10/30.
//  Copyright © 2018 juntuo. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
银行卡校验规则(Luhn算法)

 Luhn检验数字算法 （Luhn Check Digit Algorithm），也叫做模数10公式，是一种简单的算法，用于验证银行卡、信用卡号码的有效性的算法。对所有大型信用卡公司发行的信用卡都起作用， 这些公司包括美国Express、护照、万事达卡、Discover和用餐者俱乐部等。这种算法最初是在20世纪60年代由一组数学家制定，现在Luhn 检验数字算法属于大众，任何人都可以使用它。

 算法原理：将每个奇数加倍和使它变为单个的数字，如果必要的话通过减去9和在每个偶数上加上这些值。如果此卡要有效，那么，结果必须是10的倍数。

 */

@interface CheckCardNoModel : NSObject
//检验银行卡是否有z效
+ (BOOL) checkCardNo:(NSString*) cardNo;
//根据银行卡号判断银行名称
+ (NSString *)getBankName:(NSString*) cardId;
@end


