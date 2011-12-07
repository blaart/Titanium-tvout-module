/**
 * Copyright 2011 e-tunity BV
 * Licensed under the Apache License v2.0
 * http://www.apache.org/licenses/LICENSE-2.0
 * peter@e-tunity.nl
 * december 2011
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComTvoutModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TVOutManager.h"

@implementation ComTvoutModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"48d45038-79f4-41ae-8808-d6ac203fe5e6";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.tvout";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

-(void)_startTVOut
{
    [[TVOutManager sharedInstance] startTVOut];
}

-(void)_stopTVOut
{
    [[TVOutManager sharedInstance] stopTVOut];
}


#pragma Public APIs

-(void)start:(id)args
{
    NSLog(@"[INFO] starting TV out",self);
    [self performSelectorOnMainThread: @selector(_startTVOut) withObject: nil waitUntilDone: YES];	
    return;
}

-(void)stop:(id)args
{
    NSLog(@"[INFO] stopping TV out",self);
    [self performSelectorOnMainThread: @selector(_stopTVOut) withObject: nil waitUntilDone: YES];	
    return;
}

@end
