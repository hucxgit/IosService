//
//  MethodsFlexSize.m
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/3.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "MethodsFlexSize.h"

@implementation MethodsFlexSize
//设置行间距，匹配label,这里的行间距要和下面的对应，否则计算出的cell高度不精确
+(NSMutableAttributedString *)methodSetLineSpaceForLabel:(NSString*)titleText spacing:(CGFloat)spacing{
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:titleText];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [titleText length])];
    return attributedString;
}

//宽固定 计算高度
+(CGSize)methodCalculateVerticalSize:(NSString *)labelText postLabelMaxWidth:(CGFloat)postLabelMaxWidth font:(UIFont*)font defaultSpace:(CGFloat)space {
    //去除首位空格和换行
    NSString *labelTextResult = [labelText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSDictionary *cellTextDic=nil;
    if (space!=0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [paragraphStyle setLineSpacing:space];
        cellTextDic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    }else{
        cellTextDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    }
    CGSize labelSize = [labelTextResult boundingRectWithSize:CGSizeMake(postLabelMaxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:cellTextDic context:nil].size;
    return  CGSizeMake(ceil(labelSize.width), ceil(labelSize.height));// labelSize;
}






//高固定 计算宽度


+(CGSize)methodCalculateHorizontalSizeWithText:(NSString *)labelText AndLabelHeight:(CGFloat)LabelHeight font:(UIFont*)font{
    // UIFont *font = [UIFont fontWithName:@"NotoSansHans-DemiLight" size:fontSize];
    
    NSDictionary *cellTextDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    
    CGSize labelSize = [labelText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, LabelHeight) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:cellTextDic context:nil].size;
    
    return CGSizeMake(ceilf(labelSize.width), labelSize.height);
}

//set attributedText
+(void)methodSetAttributedText:(UILabel *)label fontsize:(CGFloat)fontsize textcolor:(UIColor*)textcolor range:(NSRange)range{
    NSString * result = label.text;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:result];
    
    
    [str addAttribute:NSFontAttributeName
                value:[UIFont boldSystemFontOfSize:fontsize] range:range];
    [str addAttribute:NSForegroundColorAttributeName value:textcolor range:range];
    
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [result length])];
    
    
    label.attributedText = str;

}

+(void)methodSetAttributedText:(UILabel *)label space:(float)space{
    NSString * result = label.text;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:result];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [result length])];
    label.attributedText = str;

    
    
}

@end
