//
//  NSLayoutConstraint+RecordHolder.h
//  Record Holder
//
//  Created by nate rivard on 11/29/16.
//  Copyright © 2016 nate rivard. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, NSLayoutConstraintRelatedAttribute) {
    NSLayoutConstraintRelatedAttributeTop = 1 << 0,
    NSLayoutConstraintRelatedAttributeLeading = 1 << 1,
    NSLayoutConstraintRelatedAttributeBottom = 1 << 2,
    NSLayoutConstraintRelatedAttributeTrailing = 1 << 3,
    
    NSLayoutConstraintRelatedAttributeCenterX = 1 << 4,
    NSLayoutConstraintRelatedAttributeCenterY = 1 << 5,
    
    NSLayoutConstraintRelatedAttributeHeight = 1 << 6,
    NSLayoutConstraintRelatedAttributeWidth = 1 << 7,
    
    NSLayoutConstraintRelatedAttributeLeadingMargin = 1 << 8,
    NSLayoutConstraintRelatedAttributeTrailingMargin = 1 << 9,
    
    /// start of combined section
    NSLayoutConstraintRelatedAttributeFrame = (NSLayoutConstraintRelatedAttributeTop | NSLayoutConstraintRelatedAttributeLeading | NSLayoutConstraintRelatedAttributeBottom | NSLayoutConstraintRelatedAttributeTrailing),
    NSLayoutConstraintRelatedAttributeSize = (NSLayoutConstraintRelatedAttributeHeight | NSLayoutConstraintRelatedAttributeWidth),
    NSLayoutConstraintRelatedAttributeCenter = (NSLayoutConstraintRelatedAttributeCenterX | NSLayoutConstraintRelatedAttributeCenterY),
};
