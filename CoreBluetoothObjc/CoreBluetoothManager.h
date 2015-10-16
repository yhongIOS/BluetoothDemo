//
//  CoreBluetoothManager.h
//  CoreBluetoothObjc
//
//  Created by 臧其龙 on 15/10/15.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@protocol CoreBluetoothManagerDelegate <NSObject>

- (void)coreBluetoothManagerDidScanPeripheral:(CBPeripheral *)peripheral;

@end

@interface CoreBluetoothManager : NSObject

@property (nonatomic, weak) id<CoreBluetoothManagerDelegate> delegate;

//+ (CoreBluetoothManager *)sharedManager;

- (void)scanAllPeripheralDevices;

@end
