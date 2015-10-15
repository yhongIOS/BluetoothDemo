//
//  CoreBluetoothManager.m
//  CoreBluetoothObjc
//
//  Created by 臧其龙 on 15/10/15.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "CoreBluetoothManager.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface CoreBluetoothManager ()<CBCentralManagerDelegate>
{
    CBCentralManager *centralManager;
}

@end

@implementation CoreBluetoothManager

+ (CoreBluetoothManager *)sharedManager {
    static CoreBluetoothManager *sharedAccountManagerInstance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
        
        [sharedAccountManagerInstance setupCentralManager];
    });
    
    return sharedAccountManagerInstance;
    
}

- (void)setupCentralManager
{
    centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];
}

- (void)scanAllPeripheralDevices
{
    if (centralManager) {
        [centralManager scanForPeripheralsWithServices:nil options:nil];
    }
}

#pragma mark - CBCentralManagerDelegate

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    NSLog(@"finded %@", peripheral.name);
}

@end
