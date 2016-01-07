//
//  ViewController.m
//  Lesson 21 HW 2
//
//  Created by Alex on 05.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView* viewCorner1;
@property (strong, nonatomic) UIView* viewCorner2;
@property (strong, nonatomic) UIView* viewCorner3;
@property (strong, nonatomic) UIView* viewCorner4;
@property (strong, nonatomic) UIImageView* boxer;
@property (strong, nonatomic) UIImageView* drBoomsBomb;
@property (strong, nonatomic) NSMutableArray* arrayBoxer;
@property (strong, nonatomic) NSMutableArray* arrayDrBoom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    view1.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:view1];
    [self moveView:view1 withAnimation:UIViewAnimationOptionCurveEaseInOut];
    //NSLog(@"width - %.f, height - %.f", CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));

    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 170, 50, 50)];
    view2.backgroundColor = [UIColor blueColor];
    view2.layer.cornerRadius = 20;
    [self.view addSubview:view2];
    [self moveView:view2 withAnimation:UIViewAnimationOptionCurveEaseIn];
    /*
    UIView* view3 = [[UIView alloc] initWithFrame:CGRectMake(100, 240, 50, 50)];
    view3.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:view3];
    [self moveView:view3 withAnimation:UIViewAnimationOptionCurveEaseOut];
     */
    
    self.drBoomsBomb = [[UIImageView alloc] initWithFrame:CGRectMake(0, 240, 80, 80)];
    self.drBoomsBomb.backgroundColor = [UIColor clearColor];
    self.arrayDrBoom = [[NSMutableArray alloc] init];
    // All copyrites to images belong to Blizzard
    for (int i=21; i<25; i++) {
        NSString* zeroString = [NSString stringWithFormat:@"%d",i];
        NSString* firstString = @".jpg";
        NSString* nameOfFile = [zeroString stringByAppendingString:firstString];
        UIImage* i = [UIImage imageNamed:nameOfFile];
        [self.arrayDrBoom addObject:i];
    }
    
    self.drBoomsBomb.animationImages = self.arrayDrBoom;
    self.drBoomsBomb.animationDuration = 0.5f;
    [self.drBoomsBomb startAnimating];
    
    [self.view addSubview:self.drBoomsBomb];
    [self moveView:self.drBoomsBomb withAnimation:UIViewAnimationOptionCurveEaseOut];
    
    //*****
    
    UIView* view4 = [[UIView alloc] initWithFrame:CGRectMake(100, 335, 50, 50)];
    view4.backgroundColor = [UIColor redColor];
    view4.layer.cornerRadius = 25;
    [self.view addSubview:view4];
    [self moveView:view4 withAnimation:UIViewAnimationOptionCurveLinear];
    
    self.viewCorner1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.viewCorner1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.viewCorner1];
    [self moveView:self.viewCorner1 withCorner:1];
    
    self.viewCorner2 = [[UIView alloc] initWithFrame:CGRectMake(220, 0, 100, 100)];
    self.viewCorner2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.viewCorner2];
    [self moveView:self.viewCorner2 withCorner:2];
    
    self.viewCorner3 = [[UIView alloc] initWithFrame:CGRectMake(220, 518-50, 100, 100)];
    self.viewCorner3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.viewCorner3];
    [self moveView:self.viewCorner3 withCorner:3];
    
    /*
    self.viewCorner4 = [[UIView alloc] initWithFrame:CGRectMake(0, 518, 50, 50)];
    self.viewCorner4.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.viewCorner4];
    [self moveView:self.viewCorner4 withCorner:4];
    */
    
    self.boxer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 518-50, 100, 100)];
    self.boxer.backgroundColor = [UIColor clearColor];
    self.arrayBoxer = [[NSMutableArray alloc] init];
    // All copyrites to images belong to Blizzard
    for (int i=1; i<12; i++) {
        NSString* zeroString = [NSString stringWithFormat:@"%d",i];
        NSString* firstString = @".jpg";
        NSString* nameOfFile = [zeroString stringByAppendingString:firstString];
        UIImage* i = [UIImage imageNamed:nameOfFile];
        [self.arrayBoxer addObject:i];
    }
    
    self.boxer.animationImages = self.arrayBoxer;
    self.boxer.animationDuration = 0.7f;
    [self.boxer startAnimating];
    
    [self.view addSubview:self.boxer];
    [self moveView:self.boxer withCorner:4];
    

}

- (CGFloat) randomFromZeroToOne {
    return (float)(arc4random() % 256)/255.f;
}


- (UIColor*) randomColor {
    CGFloat r = [self randomFromZeroToOne];
    CGFloat g = [self randomFromZeroToOne];
    CGFloat b = [self randomFromZeroToOne];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

- (void) moveView:(UIView*) view withAnimation:(UIViewAnimationOptions) animatores {
    
    [UIView animateWithDuration:2
                          delay:0
                        options:animatores | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) /2-50-50, view.frame.origin.y+CGRectGetHeight(view.bounds)/2);
                         view.backgroundColor = [self randomColor];
                         
                     } completion:^(BOOL finished) {
                         NSLog(@"animation finished, %d", finished);
                     }];
}

- (void) moveView:(UIView*) view withCorner:(NSInteger) corner {
    
    __block NSInteger cornerForBlock = corner;
    
    [UIView animateWithDuration:4
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         switch (corner) {
                             case 1:
                                 view.frame = CGRectMake(220, 0, 100, 100);
                                 view.backgroundColor = [UIColor yellowColor];
                                 break;
                                 
                             case 2:
                                 view.frame = CGRectMake(220,518-50,100,100);
                                 view.backgroundColor = [UIColor greenColor];
                                 break;
                             case 3:
                                 view.frame = CGRectMake(0,518-50,100,100);
                                 view.backgroundColor = [UIColor blueColor];
                                 break;
                             case 4:
                                 view.frame = CGRectMake(0,0,100,100);
                                 view.backgroundColor = [UIColor redColor];
                                 break;
                         }
            
                     } completion:^(BOOL finished) {
                         NSLog(@"animation block for corners finished, %d", finished);
                         
                         //NSInteger circkle = cornerForBlock;
                         
                         if ( (corner+1)== 5) {
                             cornerForBlock = 0;
                         }
                             [self moveView:view withCorner:cornerForBlock+1];
                         
                         
                         
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
