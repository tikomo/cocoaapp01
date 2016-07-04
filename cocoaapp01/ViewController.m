//
//  ViewController.m
//  cocoaapp01
//
//  Created by KomoritaTsuyoshi on 2016/06/30.
//  Copyright © 2016年 KomoritaTsuyoshi. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    
    __weak IBOutlet NSImageView *iv1;
    __weak IBOutlet NSImageView *iv2;
    __weak IBOutlet NSImageView *iv3;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [iv1 setImageScaling:NSImageScaleProportionallyDown];
    [iv2 setImageScaling:NSImageScaleProportionallyDown];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

// ----------------------------------------------------------------------
//
//
//
// ----------------------------------------------------------------------
- (IBAction)btn1Click:(id)sender {

    NSOpenPanel* openPanel = [NSOpenPanel openPanel];

    [openPanel setTitle:@"Choose a image file"];
    [openPanel setAllowsMultipleSelection: NO];
    [openPanel setCanChooseDirectories:NO];
    [openPanel setCanCreateDirectories:NO];
    [openPanel setCanChooseFiles:YES];
    
    [openPanel setAllowedFileTypes:[NSImage imageTypes]];
    
    [openPanel beginWithCompletionHandler:^(NSInteger result)  {
        if (result == NSFileHandlingPanelOKButton) {
            
            for( NSURL* URL in [openPanel URLs] ) {

                NSURL *url = URL;
                NSString *fullPath = [url path];
                NSString *currentSelectedFileName = [[url path] lastPathComponent];
                
                NSLog(@"%@", url);
                NSLog(@"%@", fullPath);
                NSLog(@"%@", currentSelectedFileName);

                
                NSLog(@"absoluteString : %@", [url absoluteString]);
                NSLog(@"absoluteURL : %@", [url absoluteURL]);
                NSLog(@"baseURL : %@", [url baseURL]);
                NSLog(@"fragment : %@", [url fragment]);
                NSLog(@"host : %@", [url host]);
                NSLog(@"lastPathComponent : %@", [url lastPathComponent]);
                NSLog(@"parameterString : %@", [url parameterString]);
                NSLog(@"password : %@", [url password]);
                NSLog(@"path : %@", [url path]);
                NSLog(@"pathComponents : %@", [url pathComponents]);
                NSLog(@"pathExtension : %@", [url pathExtension]);
                NSLog(@"port : %@", [url port]);
                NSLog(@"query : %@", [url query]);
                NSLog(@"relativePath : %@", [url relativePath]);
                NSLog(@"relativeString : %@", [url relativeString]);
                NSLog(@"resourceSpecifier : %@", [url resourceSpecifier]);
                NSLog(@"scheme : %@", [url scheme]);
                NSLog(@"standardizedURL : %@", [url standardizedURL]);
                NSLog(@"user : %@", [url user]);
                
                // case1
                NSImage* img = [[NSImage alloc] init];
                img = [img initWithContentsOfFile:fullPath];
                
                // case1
                // NSImage* img = [[NSImage alloc] initWithContentsOfFile:fullPath];
                
                [iv2 setImageScaling:NSImageScaleProportionallyDown];
                
                [iv2 setImage:img];
            }
            
        }
    }];
}

// ----------------------------------------------------------------------
//
//
//
// ----------------------------------------------------------------------
- (IBAction)btn2Click:(id)sender {

    
    // [iv2 setImageScaling:NSImageScaleAxesIndependently]; // ImageViewのサイズに合わせる
    //[iv2 setImageScaling:NSImageScaleNone]; // スケーリングしない
    [iv2 setImageScaling:NSImageScaleProportionallyUpOrDown]; // こっちだとImageViewのサイズでアスペクト比固定で表示
    //[iv2 setImageScaling:NSImageScaleProportionallyDown]; // ダウンだけするのかな？大きくしないんじゃないかな
    
    // case1
    [iv2 setImage:[NSImage imageNamed:@"IMG_0040.JPG"]];
    
    // case2
    // NSImage *theImage = [NSImage imageNamed:@"IMG_0040.JPG"];
    // [iv2 setImage:theImage];


}

// ----------------------------------------------------------------------
//
//
//
// ----------------------------------------------------------------------
- (IBAction)btn3Click:(id)sender {
    
    NSOpenPanel *openPanel = [[NSOpenPanel alloc] init];
    
    [openPanel setTitle:@"Choose a image file"];
    [openPanel setAllowsMultipleSelection: NO];
    [openPanel setCanChooseDirectories:NO];
    [openPanel setCanCreateDirectories:NO];
    [openPanel setCanChooseFiles:YES];
    
    [openPanel setAllowedFileTypes:[NSImage imageTypes]];
    
    if ([openPanel runModal] == NSModalResponseOK) {
        NSArray* selectedFile = [openPanel URLs];
        
        NSURL *url = (NSURL *)selectedFile[0];
        NSString *filePath = [url path];
        
        // case1
        //NSImage *theImage = [[NSImage alloc] initWithContentsOfFile:filePath];
        //[iv2 setImage:theImage];
        
        // case2
        [iv2 setImage:[[NSImage alloc] initWithContentsOfFile:filePath]];
        
        NSLog(@"%@", selectedFile[0]);
        NSLog(@"%@", filePath);
    }
}

@end
