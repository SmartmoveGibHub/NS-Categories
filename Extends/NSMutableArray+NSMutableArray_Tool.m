//
//  NSMutableArray+NSMutableArray_Tool.m
//  FoxSports
//
//  Created by Guillaume on 05/03/15.
//  Copyright (c) 2015 Netco Sports. All rights reserved.
//

#import "NSMutableArray+NSMutableArray_Tool.h"

@implementation NSMutableArray (NSMutableArray_Tool)

- (void)reverseMutableArray
{
    if ([self count] == 0)
        return;
    NSUInteger i = 0;
    NSUInteger j = [self count] - 1;
    while (i < j) {
        [self exchangeObjectAtIndex:i
                  withObjectAtIndex:j];
        
        i++;
        j--;
    }
}

-(void)removeObjectsPassingTest:(BOOL(^)(id obj, NSUInteger idx, BOOL *stop))predicate
{
    NSParameterAssert(predicate);
    NSIndexSet *setOfIndexesToRemove = [self indexesOfObjectsPassingTest:predicate];
    
    if (setOfIndexesToRemove && [setOfIndexesToRemove count] > 0)
    {
        [self removeObjectsAtIndexes:setOfIndexesToRemove];
    }
}

-(void)removeStringIdenticalTo:(NSString *)stringToRemove
{
    NSParameterAssert(stringToRemove);
    if (!stringToRemove)
        return ;
    
    [self removeObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop)
     {
         if (obj && [obj isKindOfClass:[NSString class]] && [obj isEqualToString:stringToRemove])
             return YES;
         else
             return NO;
     }];
}

-(void)moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)newIndex
{
    id object = [self objectAtIndex:index];
    [self removeObjectAtIndex:index];
    [self insertObject:object atIndex:newIndex];
}

-(void)moveObject:(id)object toIndex:(NSUInteger)newIndex
{
    NSParameterAssert(object);
    [self moveObjectAtIndex:[self indexOfObject:object] toIndex:newIndex];
}

-(void)pushBackObject:(id)object
{
    NSParameterAssert(object);
    NSUInteger index = [self count] == 0 ? 0 :[self count]-1;
    [self insertObject:object atIndex:index];
}

-(void)pushFrontObject:(id)object
{
    NSParameterAssert(object);
    [self insertObject:object atIndex:0];
}

@end
