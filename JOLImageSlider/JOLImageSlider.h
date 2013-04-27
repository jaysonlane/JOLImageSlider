//
//  JOLImageSlider.h
//  JOLImageSlider
//
//  Created by Jayson Lane on 4/27/13.
//  Copyright (c) 2013 Jayson Lane. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JOLImageSlider;

@protocol JOLImageSliderDelegate <NSObject>



@optional

- (void) imagePager:(JOLImageSlider *)imagePager didSelectImageAtIndex:(NSUInteger)index;

@end



@interface JOLImageSlider : UIView <UIScrollViewDelegate> {
    
    NSArray *slideArray;
    UIScrollView *scrollView;
    UIViewContentMode contentMode;
    
    NSString *placeholderImage;

}

@property (nonatomic, retain) NSArray *slideArray;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic) UIViewContentMode contentMode;

@property (nonatomic, retain) NSString *placeholderImage;

@property (nonatomic, weak) id <JOLImageSliderDelegate> delegate;

@end


