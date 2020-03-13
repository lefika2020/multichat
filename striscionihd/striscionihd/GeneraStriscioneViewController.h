//
//  GeneraStriscioneViewController.h
//  striscioni
//
//  Created by GC  on 20/05/14.
//  Copyright (c) 2014 giulio caruso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface GeneraStriscioneViewController : UIViewController<UITextFieldDelegate,UIActionSheetDelegate>
{
    SLComposeViewController *mySLComposerSheet;
}

@property (strong,nonatomic) IBOutlet UILabel *lblEsito;
@property (strong,nonatomic) IBOutlet UIButton *btnShare;
@property (strong,nonatomic) IBOutlet UIButton *btnReset;
@property (strong,nonatomic) IBOutlet UITextField *txtPrimo;
@property (strong,nonatomic) IBOutlet UITextField *txtSec;
@property (strong,nonatomic) IBOutlet UITextField *txtTerz;

@property (strong,nonatomic) IBOutlet UILabel *lblPrimo;
@property (strong,nonatomic) IBOutlet UILabel *lblSec;
@property (strong,nonatomic) IBOutlet UILabel *lblTerz;


@property (strong,nonatomic) IBOutlet UIButton *btnGeneraStriscione;
@property (strong,nonatomic) IBOutlet UIImageView *imgStriscione;

-(IBAction)generaStriscione:(id)sender;
-(IBAction)goBack:(id)sender;
-(IBAction)ShareFoto:(id)sender;
-(IBAction)ResetForm:(id)sender;


@end
