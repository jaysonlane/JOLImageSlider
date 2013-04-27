//
//  JOLImageSlider.m
//  JOLImageSlider
//
//  Created by Jayson Lane on 4/27/13.
//  Copyright (c) 2013 Jayson Lane. All rights reserved.
//

#import "JOLImageSlider.h"
#import "UIImageView+WebCache.h"

@implementation JOLImageSlider

@synthesize slideArray = _slideArray;
@synthesize scrollView = _scrollView;
@synthesize contentMode = _contentMode;
@synthesize placeholderImage = _placeholderImage;
@synthesize autoSlide = _autoSlide;
@synthesize titleFont = _titleFont;
@synthesize titleColor = _titleColor;

@synthesize delegate = _delegate;


- (id)initWithFrame:(CGRect)frame andSlides:(NSArray *)slideSet
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _slideArray = [[NSArray alloc] initWithArray: slideSet];
        _autoSlide = NO;
        
        
        _titleColor = [UIColor whiteColor];
        _titleFont = [UIFont fontWithName:@"Helvetica-Bold" size: 16];
        
    }
    return self;
}

- (void) layoutSubviews {
    [self initialize];
    
    
    if(_autoSlide) {
        [NSTimer scheduledTimerWithTimeInterval:3.5
                                         target:self
                                       selector:@selector(advanceSlide)
                                       userInfo:nil
                                        repeats:YES];
    }
}


- (void) initialize {
    self.clipsToBounds = YES;

    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.autoresizingMask = self.autoresizingMask;
    
    
    [self addSubview:_scrollView];
    
    [self loadData];
}

- (void) loadData
{
    if([_slideArray count] > 0)
    {
        [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * ([_slideArray count]+2),
                                               _scrollView.frame.size.height)];
        
        //Add last slide to beginning
        
        JOLImageSlide *theSlide = [_slideArray objectAtIndex: [_slideArray count]-1];
        
        CGRect imageFrame = CGRectMake(_scrollView.frame.size.width * 0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        [imageView setBackgroundColor:[UIColor clearColor]];
        [imageView setContentMode:_contentMode];
        [imageView setTag:[_slideArray count]-1];
        [imageView setImageWithURL:[NSURL URLWithString:(NSString *)theSlide.image] placeholderImage:[UIImage imageNamed:_placeholderImage]];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, (imageFrame.size.height - 28), imageFrame.size.width-70, 24)];
        titleLabel.text = theSlide.title;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = _titleColor;
        titleLabel.font = _titleFont;
        
        [imageView addSubview: titleLabel];
        
        // Add GestureRecognizer to ImageView
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                              initWithTarget:self
                                                              action:@selector(imageTapped:)];
        [singleTapGestureRecognizer setNumberOfTapsRequired:1];
        [imageView addGestureRecognizer:singleTapGestureRecognizer];
        [imageView setUserInteractionEnabled:YES];
        
        [_scrollView addSubview:imageView];
        
        //Add all slides
        
        for (int i = 0; i < [_slideArray count]; i++) {
            JOLImageSlide *theSlide = [_slideArray objectAtIndex: i];
            
            CGRect imageFrame = CGRectMake(_scrollView.frame.size.width * (i+1), 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
            [imageView setBackgroundColor:[UIColor clearColor]];
            [imageView setContentMode:_contentMode];
            [imageView setTag:i];
            [imageView setImageWithURL: [NSURL URLWithString:(NSString *)theSlide.image] placeholderImage: [UIImage imageNamed:_placeholderImage]];
            
            
            UILabel *titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, (imageFrame.size.height - 28), imageFrame.size.width-70, 24)];
            titleLabel.text = theSlide.title;
            titleLabel.backgroundColor = [UIColor clearColor];
            titleLabel.textColor = _titleColor;
            titleLabel.font = _titleFont;
            
            [imageView addSubview: titleLabel];
            
            // Add GestureRecognizer to ImageView
            UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                                  initWithTarget:self
                                                                  action:@selector(imageTapped:)];
            [singleTapGestureRecognizer setNumberOfTapsRequired:1];
            [imageView addGestureRecognizer:singleTapGestureRecognizer];
            [imageView setUserInteractionEnabled:YES];
            
            
            [_scrollView addSubview:imageView];

        }
        
        //add first slide to the end
        
        theSlide = [_slideArray objectAtIndex: 0];
        
        imageFrame = CGRectMake(_scrollView.frame.size.width * ([_slideArray count]+1), 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        [imageView setBackgroundColor:[UIColor clearColor]];
        [imageView setContentMode:_contentMode];
        [imageView setTag:0];
        [imageView setImageWithURL:[NSURL URLWithString:(NSString *)theSlide.image] placeholderImage:[UIImage imageNamed:_placeholderImage]];
        
        titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, (imageFrame.size.height - 28), imageFrame.size.width-70, 24)];
        titleLabel.text = theSlide.title;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = _titleColor;
        titleLabel.font = _titleFont;
        
        [imageView addSubview: titleLabel];
        
        // Add GestureRecognizer to ImageView
        singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                              initWithTarget:self
                                                              action:@selector(imageTapped:)];
        [singleTapGestureRecognizer setNumberOfTapsRequired:1];
        [imageView addGestureRecognizer:singleTapGestureRecognizer];
        [imageView setUserInteractionEnabled:YES];
        
        
        [_scrollView addSubview:imageView];
        
        [_scrollView setContentOffset: CGPointMake(_scrollView.frame.size.width, 0)];
        
        
    }
    else {
        UIImageView *blankImage = [[UIImageView alloc] initWithFrame:_scrollView.frame];
        //  [blankImage setImage:[_dataSource placeHolderImageForImagePager]];
        [_scrollView addSubview:blankImage];
    }
}
- (void) imageTapped:(UITapGestureRecognizer *)sender
{
    if(_delegate)
        if([_delegate respondsToSelector:@selector(imagePager:didSelectImageAtIndex:)])
            [_delegate imagePager:self didSelectImageAtIndex:[(UIGestureRecognizer *)sender view].tag];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    int numSlides = (sender.contentSize.width / sender.frame.size.width)-2;
    
    //going forward -- reset content offset
    if([sender contentOffset].x >= ((numSlides+1) * sender.frame.size.width)){
        [_scrollView setContentOffset: CGPointMake(sender.frame.size.width, 0)];
    }
    //going backwards -- reset content offset
    if([sender contentOffset].x < 1){
        [_scrollView setContentOffset: CGPointMake(numSlides * sender.frame.size.width, 0)];
    }

    
}

- (void) advanceSlide {
    [_scrollView setContentOffset: CGPointMake((_scrollView.contentOffset.x + _scrollView.frame.size.width), 0) animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
