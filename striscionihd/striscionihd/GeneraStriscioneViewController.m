
//
//  GeneraStriscioneViewController.m
//  striscioni
//
//  Created by GC  on 20/05/14.
//  Copyright (c) 2014 giulio caruso. All rights reserved.
//

#import "GeneraStriscioneViewController.h"
#import "Setting.h"




@interface GeneraStriscioneViewController ()

@end

@implementation GeneraStriscioneViewController



-(IBAction)ResetForm:(id)sender
{
    _imgStriscione.image = imgCopy;
    _txtTerz.text = @"";
    _txtSec.text = @"";
    _txtPrimo.text = @"";
    _btnShare.hidden = YES;
    _btnReset.hidden = YES;
}

UIImage *imgCopy;
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

-(void)ShareFotoTw
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) //check if Facebook Account is linked
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter]; //Tell him with what social plattform to use it, e.g. facebook or twitter
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"",mySLComposerSheet.serviceType]]; //the message you want to post
        
        UIImage *imageFB = _imgStriscione.image;
        [mySLComposerSheet addImage:imageFB]; //an image you could post
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Tweet Cancellato";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Tweet Inviato";
                break;
            default:
                break;
        } //check if everythink worked properly. Give out a message on the state.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];

}

-(void)ShareFotoFB
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) //check if Facebook Account is linked
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook]; //Tell him with what social plattform to use it, e.g. facebook or twitter
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"",mySLComposerSheet.serviceType]]; //the message you want to post
        
        
        [mySLComposerSheet addImage:_imgStriscione.image]; //an image you could post
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Post cancellato";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post inviato correttamente";
                break;
            default:
                break;
        } //check if everythink worked properly. Give out a message on the state.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];

}

-(IBAction)ShareFoto:(id)sender
{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:NSLocalizedString(@"SEL", @"")
                                  delegate:self
                                  cancelButtonTitle:NSLocalizedString(@"ANN", @"")                                 destructiveButtonTitle:nil
                                  otherButtonTitles:NSLocalizedString(@"SAV", @""),NSLocalizedString(@"FB", @""),NSLocalizedString(@"TW", @""), nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view ];

}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            [self salvaStriscione];
            break;
        case 1:
            [self ShareFotoFB];
            break;
        case 2:
            
            [self ShareFotoTw];
            break;
        default:
            break;
    }
}

-(void)salvaStriscione
{
    UIImageWriteToSavedPhotosAlbum(_imgStriscione.image,nil,nil,nil);
    _lblEsito.hidden = NO;
    _btnReset.hidden = YES;
}




-(IBAction)generaStriscione:(id)sender
{
    _lblEsito.hidden = YES;
    _imgStriscione.image = imgCopy;
    float r = [[s RetriveStringNSUD:@"r"]floatValue];
    float g = [[s RetriveStringNSUD:@"g"]floatValue];
    float b = [[s RetriveStringNSUD:@"b"]floatValue];
    
    NSString *txtPrimo = _txtPrimo.text;
    NSString *txtSec = _txtSec.text;
    NSString *txtTerz = _txtTerz.text;
    
     NSString *file = [s RetriveStringNSUD:@"file"];
    
    bool allStriscioni = YES;
    
    if([file isEqualToString:@"striscione3.png"])
    {
        
        _imgStriscione.image = [self addText:_imgStriscione.image text:txtPrimo andR:r andG:g andB:b andStriscione:file];
        _imgStriscione.image = [self addText:_imgStriscione.image text2:txtSec andR:r andG:g andB:b andStriscione:file];
        allStriscioni = NO;

    }
    
    if([file isEqualToString:@"striscione7.png"]||[file isEqualToString:@"striscione9.png"])
    {
       
        _imgStriscione.image = [self addText:_imgStriscione.image text:txtPrimo andR:r andG:g andB:b andStriscione:file];
        allStriscioni = NO;
    }
    
    if(allStriscioni)
    {
        _imgStriscione.image = [self addText:_imgStriscione.image text:txtPrimo andR:r andG:g andB:b andStriscione:file];
        _imgStriscione.image = [self addText:_imgStriscione.image text2:txtSec andR:r andG:g andB:b andStriscione:file];
        _imgStriscione.image = [self addText:_imgStriscione.image text3:txtTerz andR:r andG:g andB:b andStriscione:file];
    }
    _btnReset.hidden = NO;
    _btnShare.hidden = NO;
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([_txtPrimo isFirstResponder] && [touch view] != _txtPrimo) {
        [_txtPrimo resignFirstResponder];
    }
    
    if ([_txtSec isFirstResponder] && [touch view] != _txtSec) {
        [_txtSec resignFirstResponder];
    }
    
    if ([_txtTerz isFirstResponder] && [touch view] != _txtTerz) {
        [_txtTerz resignFirstResponder];
    }
    
    
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


-(UIImage *)addText:(UIImage *)img text:(NSString *)text1 andR:(float)r andG:(float)g andB:(float)b andStriscione:(NSString *)striscione
{
    
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
    CGContextSetRGBFillColor(context, (r/255.0f), (g/255.0f), (b/255.0f), 1);
    
    // CGContextSetTextMatrix(context, CGAffineTransformMakeRotation( -M_PI/4 ));
    if([striscione isEqualToString:@"striscione1.png"])
    {
        CGContextShowTextAtPoint(context, 115, 118, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione2.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 70, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context,40, 180, text, strlen(text));

    }
    if([striscione isEqualToString:@"striscione3.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 55, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 20, 135, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione4.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 70, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context,40, 270, text, strlen(text));

    }
    if([striscione isEqualToString:@"striscione5.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 70, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 40, 220, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione6.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 40, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 20, 130, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione7.png"])
    {
         CGContextSelectFont(context, "Ultras Liberi", 70, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 40, 125, text, strlen(text));
    }
    if([striscione isEqualToString:@"strisicone8.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 60, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 235, 270, text, strlen(text));

    }
    if([striscione isEqualToString:@"striscione9.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 160, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 20, 75, text, strlen(text));
    }
   // CGContextShowTextAtPoint(context, 70, 30, text, strlen(text));
    //Create image ref from the context
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
    
}

-(UIImage *)addText:(UIImage *)img text2:(NSString *)text1 andR:(float)r andG:(float)g andB:(float)b andStriscione:(NSString *)striscione
{
    
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
    CGContextSetRGBFillColor(context, (r/255.0f), (g/255.0f), (b/255.0f), 1);
    
    // CGContextSetTextMatrix(context, CGAffineTransformMakeRotation( -M_PI/4 ));
    if([striscione isEqualToString:@"striscione1.png"])
    {
        CGContextShowTextAtPoint(context, 20, 70, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione2.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 70, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context,40, 110, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione3.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 55, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 120, 33, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione4.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 70, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context,40, 190, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione5.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 70, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 40, 150, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione6.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 40, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 20, 90, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione7.png"])
    {
        CGContextShowTextAtPoint(context, 70, 30, text, strlen(text));
    }
    if([striscione isEqualToString:@"strisicone8.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 60, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 15, 160, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione9.png"])
    {
        CGContextShowTextAtPoint(context, 70, 30, text, strlen(text));
    }

    //CGContextShowTextAtPoint(context, 70, 30, text, strlen(text));
    //Create image ref from the context
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
    
}

-(UIImage *)addText:(UIImage *)img text3:(NSString *)text1 andR:(float)r andG:(float)g andB:(float)b andStriscione:(NSString *)striscione
{
    
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
    CGContextSetRGBFillColor(context, (r/255.0f), (g/255.0f), (b/255.0f), 1);
    
    // CGContextSetTextMatrix(context, CGAffineTransformMakeRotation( -M_PI/4 ));
    if([striscione isEqualToString:@"striscione1.png"])
    {
        CGContextShowTextAtPoint(context, 165, 35, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione2.png"])
    {
          CGContextSelectFont(context, "Ultras Liberi", 70, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 40, 30, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione3.png"])
    {
        CGContextShowTextAtPoint(context, 70, 30, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione4.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 70, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 40, 100, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione5.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 70, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 40, 80, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione6.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 40, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 20, 50, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione7.png"])
    {
        CGContextShowTextAtPoint(context, 70, 30, text, strlen(text));
    }
    if([striscione isEqualToString:@"strisicone8.png"])
    {
        CGContextSelectFont(context, "Ultras Liberi", 60, kCGEncodingMacRoman);
        CGContextShowTextAtPoint(context, 205, 50, text, strlen(text));
    }
    if([striscione isEqualToString:@"striscione9.png"])
    {
        CGContextShowTextAtPoint(context, 70, 30, text, strlen(text));
    }

   // CGContextShowTextAtPoint(context, 70, 30, text, strlen(text));
    //Create image ref from the context
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    s = [[Setting alloc]init];
    NSString *file = [s RetriveStringNSUD:@"file"];
    
    if([file isEqualToString:@"striscione3.png"])
    {
        _lblTerz.hidden = YES;
        _txtTerz.hidden = YES;
    }
    
    if([file isEqualToString:@"striscione7.png"]||[file isEqualToString:@"striscione9.png"])
    {
        _lblSec.hidden = YES;
        _lblTerz.hidden = YES;
        _txtSec.hidden = YES;
        _txtTerz.hidden = YES;
    }
    
    
    UIImage *img = [UIImage imageNamed:file];
    imgCopy = img;
    _imgStriscione.image = img;
    
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
