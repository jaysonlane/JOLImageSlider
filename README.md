JOLImageSlider
==============

An infinite image slider that supports auto-scrolling and titles.

Based heavily on KIImagePager: https://github.com/kimar/KIImagePager


## Implementing

First you'll need to create an array of JOLImageSlides:

```objective-c

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

```

Initialize the image slider:

```objective-c

JOLImageSlider *imageSlider = [[JOLImageSlider alloc] initWithFrame:CGRectMake(0, 0, 320, 140) andSlides: slideSet];

[imageSlider setAutoSlide: YES];
[imageSlider setPlaceholderImage:@"placeholder.png"];
[imageSlider setContentMode: UIViewContentModeScaleAspectFill];

[self.view addSubview: imageSlider];

```

[Optionally] add the JOLImageSliderDelegate:

```objective-c
imageSlider.delegate = self;
```
With the delegate method

```objective-c
- (void) imagePager:(JOLImageSlider *)imagePager didSelectImageAtIndex:(NSUInteger)index {
    NSLog(@"Selected slide at index: %i", index);
}
```

## Dependencies
JOLImageSlider uses SDWebImage -- to initialize and checkout this submodule:

```objective-c
git submodule update --init --recursive
```