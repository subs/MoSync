/* Copyright (C) 2011 MoSync AB
 
 This program is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License, version 2, as published by
 the Free Software Foundation.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program; see the file COPYING.  If not, write to the Free
 Software Foundation, 59 Temple Place - Suite 330, Boston, MA
 02111-1307, USA.
 */

#import "CameraPreviewWidget.h"
#import "MoSyncViewController.h"
#import "MoSyncAppDelegate.h"

#include "Platform.h"
#include <helpers/cpp_defs.h>
#include <helpers/CPP_IX_WIDGET.h>
#include <base/Syscall.h>

@implementation CameraPreviewWidget

- (id)init {
	
	view=[[UIView alloc] init];
	captureSession = [[AVCaptureSession alloc] init];
	
	captureSession.sessionPreset = AVCaptureSessionPresetMedium;
	camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	
	NSError *error = nil;
	AVCaptureDeviceInput *input =
	[AVCaptureDeviceInput deviceInputWithDevice:camera error:&error];
	
	[captureSession addInput:input];
	//previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
	previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:captureSession];
	[view.layer addSublayer:previewLayer];
	return [super init];	
}

- (int)setPropertyWithKey: (NSString*)key toValue: (NSString*)value {
	if([key isEqualToString:@"someproperty"]) {
	} else {
		return [super setPropertyWithKey:key toValue:value];
	}
	return MAW_RES_OK;
}

- (NSString*)getPropertyWithKey: (NSString*)key {
	if([key isEqualToString:@"someproperty"]) {
		
	} else {
		return [super getPropertyWithKey:key];
	}
	
	return @"";
}

- (void)show {
	previewLayer.frame = view.bounds;
	[captureSession startRunning];
	[super show];
}



@end
