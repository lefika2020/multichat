//
//  AnteprimaViewController.h
//  striscioni
//
//  Created by GC  on 20/05/14.
//  Copyright (c) 2014 giulio caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnteprimaViewController : UIViewController
{
    IBOutlet UIImageView *imgAnte;
}

@property (nonatomic,retain) IBOutlet UIImageView *imgAnte;

-(IBAction)goBack:(id)sender;

@end
