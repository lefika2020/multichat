//
//  ImpostazioniViewController.m
//  striscioni
//
//  Created by GC  on 20/05/14.
//  Copyright (c) 2014 giulio caruso. All rights reserved.
//

#import "ImpostazioniViewController.h"
#import "Setting.h"

@interface ImpostazioniViewController ()

@end

@implementation ImpostazioniViewController

-(IBAction)saveSettings:(id)sender
{
    [s SaveStringNSUD:[NSString stringWithFormat:@"%f",_r.value] andKey:@"r"];
    [s SaveStringNSUD:[NSString stringWithFormat:@"%f",_g.value] andKey:@"g"];
    [s SaveStringNSUD:[NSString stringWithFormat:@"%f",_b.value] andKey:@"b"];
}


Setting *s;

-(IBAction)sliderValueChanged:(UISlider*)slider
{
    float r=[[NSString stringWithFormat:@"%.0f",_r.value] floatValue];
    float g=[[NSString stringWithFormat:@"%.0f",_g.value]floatValue];
    float b=[[NSString stringWithFormat:@"%.0f",_b.value]floatValue];
    
    
    UIColor *colorToSet=[UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1];
    [_colorLabel setTextColor:colorToSet];
}

-(IBAction)goBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    s = [[Setting alloc]init];
    
    UIFont *font = [UIFont fontWithName:@"Ultras Liberi" size:33.0];
    [_colorLabel setFont:font];
    
    float r = [[s RetriveStringNSUD:@"r"] floatValue];
    float g = [[s RetriveStringNSUD:@"g"] floatValue];
    float b = [[s RetriveStringNSUD:@"b"] floatValue];
    
    _r.value = r;
    _g.value = g;
    _b.value = b;
    
    UIColor *colorToSet=[UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1];
    [_colorLabel setTextColor:colorToSet];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
