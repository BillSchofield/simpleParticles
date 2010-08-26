//
//  Timer.h
//  Particles
//
//  Created by bschofil on 8/25/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

@interface Timer : NSObject {
	NSDate* timeOfLastUpdate;
	double timeUpdateInterval;
}
-(id) init;
-(void) update;
-(double) timeSinceLastUpdateInSeconds;

@end
