//
//  NSLayoutConstraint+RecordHolder.swift
//  Record Holder
//
//  Created by nate rivard on 5/10/15.
//  Copyright (c) 2015 nate rivard. All rights reserved.
//

import UIKit

extension UIView {
    
    /// creates constraints that are identical to the provided view's same constraints
    /// for ex: [.top, .leading, .bottom, .trailing] would create constraints where self's frame is the same as the provided view's
    /// you could also use a convenience set of constraints like .frame, .size, or .center
    /// if activate is true (the default) then constraints will be activated for you.
    public func constraintsEqualTo(_ view: UIView, constraintOptions: NSLayoutConstraintRelatedAttribute, activate: Bool = true) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        
        if constraintOptions.contains(.top) {
            constraints.append(self.topAnchor.constraint(equalTo: view.topAnchor))
        }
        
        if constraintOptions.contains(.leading) {
            constraints.append(self.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        }
        
        if constraintOptions.contains(.bottom) {
            constraints.append(self.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        }
        
        if constraintOptions.contains(.trailing) {
            constraints.append(self.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        }
        
        if constraintOptions.contains(.centerX) {
            constraints.append(self.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        }
        
        if constraintOptions.contains(.centerY) {
            constraints.append(self.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        }
        
        if constraintOptions.contains(.height) {
            constraints.append(self.heightAnchor.constraint(equalTo: view.heightAnchor))
        }
        
        if constraintOptions.contains(.width) {
            constraints.append(self.widthAnchor.constraint(equalTo: view.widthAnchor))
        }
        
        if activate {
            NSLayoutConstraint.activate(constraints)
        }
        
        return constraints
    }
    
    /// this function looks for specific pairings of layout constraints, offsets one by the offset, and offets another by -(offset)
    /// for ex: [.top, .bottom] offset by 8.0 would offset .top by 8 and .bottom by -8.0
    /// also supports [.leading, .trailing] right now
    public func opposingConstraintsFor(_ view: UIView, opposingConstraints: NSLayoutConstraintRelatedAttribute, offsetBy offset: CGFloat, activate: Bool = true) -> [NSLayoutConstraint] {
        let constraints: [NSLayoutConstraint]
        
        if opposingConstraints.contains(.top) && opposingConstraints.contains(.bottom) {
            constraints = [self.topAnchor.constraint(equalTo: view.topAnchor, constant: offset), self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -offset)]
        } else if opposingConstraints.contains(.leading) && opposingConstraints.contains(.trailing) {
            constraints = [self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offset), self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -offset)]
        } else {
            constraints = []
        }
        
        if activate {
            NSLayoutConstraint.activate(constraints)
        }
        
        return constraints
    }
}
