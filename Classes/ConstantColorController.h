//
//  ConstantColorController.h
//  Particles
//
//  Created by bschofil on 8/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Controller.h"
#import "Color.h"

@interface ConstantColorController : Controller 
{
}
-(id) initWithColors:(Color*) colors withNumberOfColors: (int) numberOfColors;
-(void) update;
@end