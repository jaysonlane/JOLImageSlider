//
//  JOLImageSlide.h
//  JOLImageSlider
//
//  Created by Jayson Lane on 4/27/13.
//  Copyright (c) 2013 Jayson Lane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JOLImageSlide : NSObject {
    
    NSString *image;
    NSString *title;
    
}

@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *title;

@end
