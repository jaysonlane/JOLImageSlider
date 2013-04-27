//
//  JOLImageSlider.h
//  JOLImageSlider
//
//  Created by Jayson Lane on 4/27/13.
//  Copyright (c) 2013 Jayson Lane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JOLImageSlide.h"

@class JOLImageSlider;

@protocol JOLImageSliderDelegate <NSObject>



@optional

- (void) imagePager:(JOLImageSlider *)imagePager didSelectImageAtIndex:(NSUInteger)index;

@end



@interface JOLImageSlider : UIView <UIScrollViewDelegate> {
    
    NSArray *slideArray;
    UIScrollView *scrollView;
    UIViewContentMode contentMode;
    UIFont *titleFont;
    UIColor *titleColor;
    
    NSString *placeholderImage;
    
    BOOL autoSlide;
    
}

@property (nonatomic, retain) NSArray *slideArray;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic) UIViewContentMode contentMode;
@property (nonatomic, retain) UIFont *titleFont;
@property (nonatomic, retain) UIColor *titleColor;

@property (nonatomic, retain) NSString *placeholderImage;

@property (nonatomic) BOOL autoSlide;

@property (nonatomic, weak) id <JOLImageSliderDelegate> delegate;

- (id)initWithFrame:(CGRect)frame andSlides:(NSArray *)slideSet;

@end


