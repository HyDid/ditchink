//
//  headerImage.m
//  ditchink
//
//  Created by Song on 16/11/13.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#define imageCount 3

#import "headerImage.h"

@interface headerImage() <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property(nonatomic,strong) NSTimer *timer;

@end

@implementation headerImage

+(instancetype)headerImage {
    return [[[NSBundle mainBundle] loadNibNamed:@"headerImage" owner:nil options:nil]lastObject];
}



- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 放图片
    CGFloat imgH = self.scrollView.frame.size.height;
    CGFloat imgW = self.scrollView.frame.size.width;
    CGFloat imgY = 0;
    
    for (int i = 0; i<imageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        CGFloat imgX = imgW * i;
        imageView.frame = CGRectMake(imgX, imgY, imgW, imgH);
        NSString *name = [NSString stringWithFormat:@"icon-picture%d",i+1];
        imageView.image = [UIImage imageNamed:name];
        
        [self.scrollView addSubview:imageView];
    }
    
    // 滚动范围
    self.scrollView.contentSize = CGSizeMake(imageCount * imgW, 0);
    
    // 自动分页
    self.scrollView.pagingEnabled = YES;
    
    // 设置pageControl页数
    self.pageControl.numberOfPages = imageCount;
    
    // 添加定时器
    [self addTimer];
}

// 添加定时器
-(void)addTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(autoplay) userInfo:nil repeats:YES];
    // 优先级
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

// 暂停定时器
-(void)removeTimer {
    [self.timer invalidate]; // invalidate：使无效
    self.timer = nil;
}

// 自动播放
-(void)autoplay {
    NSInteger page;
    if (self.pageControl.currentPage == imageCount - 1) { // 如果是最后一张图片
        page = 0; // 自动轮播到第一张图片
//        NSLog(@"page = 0");
    }else {
        page = self.pageControl.currentPage + 1; // 或者，轮播下一张图片
//        NSLog(@"next page");
    }
    
    // scrollview滚动位置
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}


#pragma mark - 代理方法
// 将pageControl与图片捆绑
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scrollW = scrollView.frame.size.width;
    int page = (scrollW * 0.5 + scrollView.contentOffset.x) / scrollW;
    self.pageControl.currentPage = page;
}

// 开始拖拽
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

// 结束拖拽
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];
}


@end
