//
//  AnteprimaViewController.m
//  striscioni
//
//  Created by GC  on 20/05/14.
//  Copyright (c) 2014 giulio caruso. All rights reserved.
//

#import "AnteprimaViewController.h"
#import "Setting.h"

@interface AnteprimaViewController ()

@end

@implementation AnteprimaViewController
@synthesize imgAnte;

Setting *s;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)goBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    NSString *file = [s RetriveStringNSUD:@"file"];
    UIImage *img = [UIImage imageNamed:file];
    imgAnte.image = img;
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
