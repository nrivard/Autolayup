//
//  UIView+Autolayup.swift
//  Autolayup
//
//  Created by nate rivard on 5/10/15.
//  Copyright (c) 2015 nate rivard. All rights reserved.
//

import UIKit

extension UIView {
    
    /// creates constraints that are identical to the provided view's same constraints
    /// for ex: [.top, .leading, .bottom, .trailing] would create constraints where self's frame is the same as the provided guide's
    /// constant is more appropriate for a single constraint. if you want an inset you should really use opposingConstraintsFor(_:::)
    /// you could also use a convenience set of constraints like .frame, .size, or .center
    /// set a priority to all generated constraints, which by default, is .required
    /// if activate is true (the default) then constraints will be activated for you.
    @objc(constraintsEqualToGuide:boundToAnchors:constant:priority:activate:)
    @discardableResult public func constraintsEqualTo(_ guide: LayoutAnchorProviding, boundTo constraintOptions: LayoutAnchorRelation, constant: CGFloat = 0.0, priority: UILayoutPriority = .required, activate: Bool = true) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        
        if constraintOptions.contains(.top) {
            constraints.append(self.topAnchor.constraint(equalTo: guide.topAnchor, constant: constant))
        }
        
        if constraintOptions.contains(.leading) {
            constraints.append(self.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: constant))
        }
        
        if constraintOptions.contains(.bottom) {
            constraints.append(self.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: constant))
        }
        
        if constraintOptions.contains(.trailing) {
            constraints.append(self.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: constant))
        }
        
        if constraintOptions.contains(.centerX) {
            constraints.append(self.centerXAnchor.constraint(equalTo: guide.centerXAnchor, constant: constant))
        }
        
        if constraintOptions.contains(.centerY) {
            constraints.append(self.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: constant))
        }
        
        if constraintOptions.contains(.height) {
            constraints.append(self.heightAnchor.constraint(equalTo: guide.heightAnchor, constant: constant))
        }
        
        if constraintOptions.contains(.width) {
            constraints.append(self.widthAnchor.constraint(equalTo: guide.widthAnchor, constant: constant))
        }
        
        constraints.forEach {
            $0.priority = priority
            $0.isActive = activate
        }
        
        return constraints
    }
    
    /// this function looks for specific pairings of layout constraints, offsets one by the offset, and offets another by -(offset)
    /// for ex: [.top, .bottom] offset by 8.0 would offset .top by 8 and .bottom by -8.0
    /// also supports [.leading, .trailing] right now
    @objc(opposingConstraintsForGuide:boundToAnchors:offset:priority:activate:)
    @discardableResult public func opposingConstraintsFor(_ guide: LayoutAnchorProviding, boundTo opposingConstraints: LayoutAnchorRelation, offsetBy offset: CGFloat, priority: UILayoutPriority = .required, activate: Bool = true) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        
        if opposingConstraints.contains(.top) && opposingConstraints.contains(.bottom) {
            constraints += [self.topAnchor.constraint(equalTo: guide.topAnchor, constant: offset), self.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -offset)]
        }
        
        if opposingConstraints.contains(.leading) && opposingConstraints.contains(.trailing) {
            constraints += [self.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: offset), self.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -offset)]
        }
        
        constraints.forEach {
            $0.priority = priority
            $0.isActive = activate
        }
        
        return constraints
    }
    
    /// Creates a set constraint for a particular attribute without reference to another view
    /// ex: .height == 40.0
    @objc(constraintForAttribute:constant:priority:activate:)
    @discardableResult public func constraintFor(_ attribute: NSLayoutConstraint.Attribute, equalTo constant: CGFloat, priority: UILayoutPriority = .required, activate: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: constant)
        constraint.priority = priority
        constraint.isActive = activate
        return constraint
    }
}

extension LayoutAnchorRelation: Hashable {

    public var hashValue: Int {
        return Int(self.rawValue)
    }
}
