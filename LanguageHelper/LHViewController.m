//
//  LHViewController.m
//  LanguageHelper
//
//  Created by hecor on 11/26/12.
//  Copyright (c) 2012 pzy. All rights reserved.
//

#import "LHViewController.h"
#import "tesseract.h"

@interface LHViewController ()

@end

@implementation LHViewController

@synthesize imageView,toolbar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup
{
    [self setupAppearence];
}

- (void)setupAppearence
{
    
    UIBarButtonItem *cameraBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(takePicture:)];
    
    [[self toolbar] setItems:[NSArray arrayWithObject:cameraBarButtonItem]];
}

- (void)takePicture:(id) sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentModalViewController:imagePicker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo: (NSDictionary *)info
{
    finalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.imageView setImage:finalImage];
    
    // UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    
    [self dismissModalViewControllerAnimated:YES];
    
    // Show the language help on the image
    
    [self showLanguageHelp:finalImage];
}

- (void)showLanguageHelp:(UIImage *) originalImage
{
    Tesseract* tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];
    //[tesseract setImage:[UIImage imageNamed:@"image_sample.jpg"]];
    [tesseract setImage:originalImage];
    [tesseract recognize];
    
    NSLog(@"%@", [tesseract recognizedText]);
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
