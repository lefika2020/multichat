//
//  FirstViewController.h
//  striscioni
//
//  Created by GC  on 20/05/14.
//  Copyright (c) 2014 giulio caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SceltaStriscioneViewController : UIViewController
{
    IBOutlet UIImageView *img1;
    IBOutlet UIImageView *img2;
    IBOutlet UIImageView *img3;
    IBOutlet UIImageView *img4;
    IBOutlet UIImageView *img5;
    IBOutlet UIImageView *img6;
    IBOutlet UIImageView *img7;
    IBOutlet UIImageView *img8;
    IBOutlet UIImageView *img9;
    
    IBOutlet UIImageView *conf1;
    IBOutlet UIImageView *conf2;
    IBOutlet UIImageView *conf3;
    IBOutlet UIImageView *conf4;
    IBOutlet UIImageView *conf5;
    IBOutlet UIImageView *conf6;
    IBOutlet UIImageView *conf7;
    IBOutlet UIImageView *conf8;
    IBOutlet UIImageView *conf9;
    
    IBOutlet UIBarButtonItem *btnGenera;
    
}

@property (nonatomic,retain) IBOutlet UIBarButtonItem *btnGenera;

@property (nonatomic,retain) IBOutlet UIImageView *conf1;
@property (nonatomic,retain) IBOutlet UIImageView *conf2;
@property (nonatomic,retain) IBOutlet UIImageView *conf3;
@property (nonatomic,retain) IBOutlet UIImageView *conf4;
@property (nonatomic,retain) IBOutlet UIImageView *conf5;
@property (nonatomic,retain) IBOutlet UIImageView *conf6;
@property (nonatomic,retain) IBOutlet UIImageView *conf7;
@property (nonatomic,retain) IBOutlet UIImageView *conf8;
@property (nonatomic,retain) IBOutlet UIImageView *conf9;

@property (nonatomic,retain)  IBOutlet UIImageView *img1;
@property (nonatomic,retain)  IBOutlet UIImageView *img2;
@property (nonatomic,retain)  IBOutlet UIImageView *img3;
@property (nonatomic,retain)  IBOutlet UIImageView *img4;
@property (nonatomic,retain)  IBOutlet UIImageView *img5;
@property (nonatomic,retain)  IBOutlet UIImageView *img6;
@property (nonatomic,retain)  IBOutlet UIImageView *img7;
@property (nonatomic,retain)  IBOutlet UIImageView *img8;
@property (nonatomic,retain)  IBOutlet UIImageView *img9;

-(IBAction)setText:(id)sender;

-(IBAction)anteprimaImage1:(id)sender;
-(IBAction)anteprimaImage2:(id)sender;
-(IBAction)anteprimaImage3:(id)sender;
-(IBAction)anteprimaImage4:(id)sender;
-(IBAction)anteprimaImage5:(id)sender;
-(IBAction)anteprimaImage6:(id)sender;
-(IBAction)anteprimaImage7:(id)sender;
-(IBAction)anteprimaImage8:(id)sender;
-(IBAction)anteprimaImage9:(id)sender;


-(IBAction)scegliImage1:(id)sender;
-(IBAction)scegliImage2:(id)sender;
-(IBAction)scegliImage3:(id)sender;
-(IBAction)scegliImage4:(id)sender;
-(IBAction)scegliImage5:(id)sender;
-(IBAction)scegliImage6:(id)sender;
-(IBAction)scegliImage7:(id)sender;
-(IBAction)scegliImage8:(id)sender;
-(IBAction)scegliImage9:(id)sender;

-(IBAction)generaStriscione:(id)sender;
-(IBAction)goImpostazioni:(id)sender;

@end
