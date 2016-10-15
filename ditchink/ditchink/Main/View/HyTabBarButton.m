//
//  HyTabBarButton.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyTabBarButton.h"

const double HyTabBarImagescale = 0.65;

@implementation HyTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        // 2.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:HyColor(236, 103, 0) forState:UIControlStateSelected];
        [self setTitleColor:HyColor(250, 163, 25) forState:UIControlStateNormal];
        
        // 3.设置选中时的背景图片
        [self setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        
        
    }
    return self;
}

/**
 *  目的是去掉父类在高亮时所做的操作
 */
- (void)setHighlighted:(BOOL)highlighted {}

#pragma mark 设置按钮标题的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleY = contentRect.size.height * HyTabBarImagescale;
    CGFloat titleH = contentRect.size.height - titleY;
    CGFloat titleW = contentRect.size.width;
    return CGRectMake(0, titleY, titleW,  titleH);
}

#pragma mark 设置按钮图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageH = contentRect.size.height * HyTabBarImagescale;
    CGFloat imageW = contentRect.size.width;
    return CGRectMake(0, 0, imageW,  imageH);
}
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // 1.利用KVO监听item属性值的改变
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];

    
    // 2.属性赋值
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}
/**
 *  KVO监听必须在监听器释放的时候，移除监听操作
 *  通知也得在释放的时候移除监听
 */
- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];

}
/**
 *  监听item的属性值改变
 *
 *  @param keyPath 哪个属性改变了
 *  @param object  哪个对象的属性改变了
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
}




@end
