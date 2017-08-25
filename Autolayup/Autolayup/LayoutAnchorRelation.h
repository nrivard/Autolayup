//
//  LayoutAnchorRelation.h
//  Autolayup
//
//  Created by nate rivard on 11/29/16.
//  Copyright © 2016 nate rivard. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, LayoutAnchorRelation) {
    LayoutAnchorRelationTop = 1 << 0,
    LayoutAnchorRelationLeading = 1 << 1,
    LayoutAnchorRelationBottom = 1 << 2,
    LayoutAnchorRelationTrailing = 1 << 3,
    
    LayoutAnchorRelationCenterX = 1 << 4,
    LayoutAnchorRelationCenterY = 1 << 5,
    
    LayoutAnchorRelationHeight = 1 << 6,
    LayoutAnchorRelationWidth = 1 << 7,
    
    /// start of combined section
    LayoutAnchorRelationFrame = (LayoutAnchorRelationTop | LayoutAnchorRelationLeading | LayoutAnchorRelationBottom | LayoutAnchorRelationTrailing),
    LayoutAnchorRelationSize = (LayoutAnchorRelationHeight | LayoutAnchorRelationWidth),
    LayoutAnchorRelationCenter = (LayoutAnchorRelationCenterX | LayoutAnchorRelationCenterY),
};
