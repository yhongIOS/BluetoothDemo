//
//  CoreBluetoothManager.h
//  CoreBluetoothObjc
//
//  Created by 臧其龙 on 15/10/15.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreBluetoothManager : NSObject

+ (CoreBluetoothManager *)sharedManager;

- (void)scanAllPeripheralDevices;

@end
