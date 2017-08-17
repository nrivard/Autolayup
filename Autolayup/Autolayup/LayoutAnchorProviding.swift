//
//  LayoutGuiding.swift
//  Autolayup
//
//  Created by Nate Rivard on 8/17/17.
//  Copyright © 2017 Nate Rivard. All rights reserved.
//

import Foundation

/// describes a protocol that vends certain anchors
@objc public protocol LayoutAnchorProviding {
    
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: LayoutAnchorProviding { }

extension UILayoutGuide: LayoutAnchorProviding { }
