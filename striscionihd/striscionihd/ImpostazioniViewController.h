//
//  ImpostazioniViewController.h
//  striscioni
//
//  Created by GC  on 20/05/14.
//  Copyright (c) 2014 giulio caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImpostazioniViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISlider *r;
@property (strong, nonatomic) IBOutlet UISlider *g;
@property (strong, nonatomic) IBOutlet UISlider *b;
@property (strong, nonatomic) IBOutlet UILabel *colorLabel;

-(IBAction)sliderValueChanged:(UISlider*)slider;

-(IBAction)goBack:(id)sender;
-(IBAction)saveSettings:(id)sender;


@end
