//
//  ViewController.m
//  JOLImageSlider
//
//  Created by Jayson Lane on 4/27/13.
//  Copyright (c) 2013 Jayson Lane. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    JOLImageSlide *slide = [[JOLImageSlide alloc] init];
    slide.title = @"Hello World";
    slide.image = @"http://vipdictionary.com/img/istockphoto_3905249-dignified-mustache-man.jpg";
    
    JOLImageSlide *slide2 = [[JOLImageSlide alloc] init];
    slide2.title = @"Hello World (again)";
    slide2.image = @"http://img3.etsystatic.com/016/1/5193227/il_340x270.426695535_bso3.jpg";
    
    JOLImageSlide *slide3 = [[JOLImageSlide alloc] init];
    slide3.title = @"Lost Slide";
    slide3.image = @"http://google.com/asdf.png";

    NSArray *slideSet = [[NSArray alloc] initWithObjects: slide, slide2, slide3, nil];
    
    
    JOLImageSlider *imageSlider = [[JOLImageSlider alloc] initWithFrame:CGRectMake(0, 0, 320, 140) andSlides: slideSet];
    
    imageSlider.delegate = self;
    [imageSlider setAutoSlide: YES];
    [imageSlider setPlaceholderImage:@"placeholder.png"];
    [imageSlider setContentMode: UIViewContentModeScaleAspectFill];
    
    
    
    [self.view addSubview: imageSlider];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) imagePager:(JOLImageSlider *)imagePager didSelectImageAtIndex:(NSUInteger)index {
    NSLog(@"Selected slide at index: %i", index);
}

@end
