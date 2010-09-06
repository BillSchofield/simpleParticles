//
//  FakeTimer.h
//  Particles
//
//  Created by bschofil on 9/5/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Timer.h"

@interface FakeTimer : Timer {
	double timeOfLastUpdate;
	double timeUpdateInterval;
}
-(void) timeUpdateInterval: (double) sourceTimeInterval;

@end
