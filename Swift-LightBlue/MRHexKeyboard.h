//
//  MRHexKeyboard.h
//
//  Created by Mikk Rätsep on 02/10/13.
//  Copyright (c) 2013 Mikk Rätsep. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DoneAction) (void);

@interface MRHexKeyboard : UIView

- (MRHexKeyboard *)initWithTextField:(UITextField *)textField;

-(void)setDoneAction:(DoneAction)action;

@end
