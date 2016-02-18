//
//  Unit.m
//  Teutonica
//
//  Created by Aleksander on 25/12/15.
//  Copyright © 2015 Aleksander. All rights reserved.
//

#import "Unit.h"
@implementation Unit


- (id)init {
    self = [super init];
    return self;
}

- (void) attackedBy: (Unit*) attackingUnit{
    NSUInteger damageDealt,attackPoints,defencePoints,luckFactor, unitHealth, killedUnits;
    attackPoints = *(attackingUnit.attack);
    defencePoints = *(_defence);
    luckFactor = *(attackingUnit.luck);
    unitHealth = *(_health);
    
    for (NSInteger* i = 0; i < attackingUnit.amount; i++)
        damageDealt += defencePoints - (attackPoints + (attackPoints * (luckFactor * arc4random())));
    
    killedUnits = damageDealt / unitHealth;
    self.amount -=killedUnits;
    
    if(self.amount <=0)
        [self unitKilled];
}

- (void) unitKilled
{
    self.unitAvatar = nil;
}
- (void) unitDisbanded
{
    self.unitAvatar = nil;
}
@end
