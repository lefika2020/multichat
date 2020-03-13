//
//  FirstViewController.m
//  striscioni
//
//  Created by GC  on 20/05/14.
//  Copyright (c) 2014 giulio caruso. All rights reserved.
//

#import "SceltaStriscioneViewController.h"
#import "AnteprimaViewController.h"
#import "Setting.h"
@interface SceltaStriscioneViewController ()

@end



@implementation SceltaStriscioneViewController
@synthesize img1,img2,img3,img4,img5,img6,img7,img8,img9,conf1,conf2,conf3,conf4,conf5,conf6,conf7,conf8,conf9,btnGenera;

Setting *s;

-(IBAction)generaStriscione:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AnteprimaViewController *viewController = (AnteprimaViewController *)[storyboard instantiateViewControllerWithIdentifier:@"genera"];
    [self presentViewController:viewController animated:YES completion:nil];
}

-(IBAction)goImpostazioni:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AnteprimaViewController *viewController = (AnteprimaViewController *)[storyboard instantiateViewControllerWithIdentifier:@"impo"];
    [self presentViewController:viewController animated:YES completion:nil];
}


-(void)ShowAnte
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AnteprimaViewController *viewController = (AnteprimaViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ante"];
    [self presentViewController:viewController animated:YES completion:nil];
}

-(void)HideAllAndVisibleSelect:(UIImageView *)NotHide
{
    conf1.hidden = YES;
    conf2.hidden = YES;
    conf3.hidden = YES;
    conf4.hidden = YES;
    conf5.hidden = YES;
    conf6.hidden = YES;
    conf7.hidden = YES;
    conf8.hidden = YES;
    conf9.hidden = YES;
    NotHide.hidden =NO;
}

-(IBAction)anteprimaImage1:(id)sender
{
    NSString *fileName = @"striscione1.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    [self ShowAnte];
    
}

-(IBAction)anteprimaImage2:(id)sender
{
    NSString *fileName = @"striscione2.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    [self ShowAnte];
}

-(IBAction)anteprimaImage3:(id)sender
{
    NSString *fileName = @"striscione3.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    [self ShowAnte];
}

-(IBAction)anteprimaImage4:(id)sender
{
    NSString *fileName = @"striscione4.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    [self ShowAnte];
}

-(IBAction)anteprimaImage5:(id)sender
{
    NSString *fileName = @"striscione5.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    [self ShowAnte];
}

-(IBAction)anteprimaImage6:(id)sender
{
    NSString *fileName = @"striscione6.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    [self ShowAnte];
}

-(IBAction)anteprimaImage7:(id)sender
{
    NSString *fileName = @"striscione7.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    [self ShowAnte];
}

-(IBAction)anteprimaImage8:(id)sender
{
    NSString *fileName = @"strisicone8.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    [self ShowAnte];
    
    
}

-(IBAction)anteprimaImage9:(id)sender
{
    NSString *fileName = @"striscione9.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    [self ShowAnte];
}

-(IBAction)scegliImage1:(id)sender
{
    [self HideAllAndVisibleSelect:conf1];
    NSString *fileName = @"striscione1.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    btnGenera.enabled = YES;
}


-(IBAction)scegliImage2:(id)sender
{
   [self HideAllAndVisibleSelect:conf2];
    NSString *fileName = @"striscione2.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    btnGenera.enabled = YES;
}

-(IBAction)scegliImage3:(id)sender
{
    [self HideAllAndVisibleSelect:conf3];
    NSString *fileName = @"striscione3.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    btnGenera.enabled = YES;
}


-(IBAction)scegliImage4:(id)sender
{
    [self HideAllAndVisibleSelect:conf4];
    NSString *fileName = @"striscione4.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    btnGenera.enabled = YES;
}


-(IBAction)scegliImage5:(id)sender
{
    [self HideAllAndVisibleSelect:conf5];
    NSString *fileName = @"striscione5.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    btnGenera.enabled = YES;
}


-(IBAction)scegliImage6:(id)sender
{
    [self HideAllAndVisibleSelect:conf6];
    NSString *fileName = @"striscione6.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    btnGenera.enabled = YES;
}


-(IBAction)scegliImage7:(id)sender
{
    [self HideAllAndVisibleSelect:conf7];
    NSString *fileName = @"striscione7.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    btnGenera.enabled = YES;
}


-(IBAction)scegliImage8:(id)sender
{
    [self HideAllAndVisibleSelect:conf8];
    NSString *fileName = @"strisicone8.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    btnGenera.enabled = YES;
    
}


-(IBAction)scegliImage9:(id)sender
{
    [self HideAllAndVisibleSelect:conf9];
    NSString *fileName = @"striscione9.png";
    [s SaveStringNSUD:fileName andKey:@"file"];
    btnGenera.enabled = YES;
}


-(IBAction)setText:(id)sender
{
    
    // imgV.image = [self addText:imgV.image text:@"prova"];
}

-(UIImage *)addText:(UIImage *)img text:(NSString *)text1
{
    NSString *fontPath = [[NSBundle mainBundle] pathForResource:@"ultrasliberi" ofType:@"ttf"];
    
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithFilename([fontPath UTF8String]);
    
    // Create the font with the data provider, then release the data provider. customFont =
    CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    //get image width and height
    int w = img.size.width;
    int h = img.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //create a graphic context with CGBitmapContextCreate
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGContextSetRGBFillColor(context, 0.0, 1.0, 1.0, 1);
    char* text = (char *)[text1 cStringUsingEncoding:NSASCIIStringEncoding];
    CGContextSelectFont(context, "Ultras Liberi", 30, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, 255, 0, 0, 1);
    
    // CGContextSetTextMatrix(context, CGAffineTransformMakeRotation( -M_PI/4 ));
    CGContextShowTextAtPoint(context, 60, 390, text, strlen(text));
    //Create image ref from the context
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
    
}

-(void)setImmagineTonda:(UIImageView *)img
{
    img.userInteractionEnabled = YES;
    img.layer.cornerRadius = img.frame.size.height /2;
    img.layer.masksToBounds = YES;
    img.layer.borderWidth = 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    btnGenera.enabled = NO;
    s = [[Setting alloc]init];
    [self setImmagineTonda:img1];
    [self setImmagineTonda:img2];
    [self setImmagineTonda:img3];
    [self setImmagineTonda:img4];
    [self setImmagineTonda:img5];
    [self setImmagineTonda:img6];
    [self setImmagineTonda:img7];
    [self setImmagineTonda:img8];
    [self setImmagineTonda:img9];
    
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scegliImage1:)];
    [img1 addGestureRecognizer:tapGesture1];
    
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scegliImage2:)];
    [img2 addGestureRecognizer:tapGesture2];
    
    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scegliImage3:)];
    [img3 addGestureRecognizer:tapGesture3];
    
    UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scegliImage4:)];
    [img4 addGestureRecognizer:tapGesture4];
    
    UITapGestureRecognizer *tapGesture5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scegliImage5:)];
    [img5 addGestureRecognizer:tapGesture5];
    
    UITapGestureRecognizer *tapGesture6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scegliImage6:)];
    [img6 addGestureRecognizer:tapGesture6];
    
    UITapGestureRecognizer *tapGesture7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scegliImage7:)];
    [img7 addGestureRecognizer:tapGesture7];
    
    UITapGestureRecognizer *tapGesture8 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scegliImage8:)];
    [img8 addGestureRecognizer:tapGesture8];
    
    UITapGestureRecognizer *tapGesture9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scegliImage9:)];
    [img9 addGestureRecognizer:tapGesture9];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
