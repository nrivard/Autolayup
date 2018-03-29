//
//  Autolayup_iOSTests.m
//  Autolayup-iOSTests
//
//  Created by Nate Rivard on 2/4/17.
//  Copyright © 2017 Nate Rivard. All rights reserved.
//

#import <XCTest/XCTest.h>

@import Autolayup;

@interface Autolayup_tvOSTests : XCTestCase
@property (nonatomic, retain) UIViewController *testViewController;
@property (nonatomic, retain) UIView *testView;
@end

@implementation Autolayup_tvOSTests

- (void)setUp {
    [super setUp];
    
    self.testViewController = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    self.testView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.testViewController.view addSubview:self.testView];
}

- (void)tearDown {
    [super tearDown];
    
    self.testViewController = nil;
    self.testView = nil;
}

- (void)testFrameConstraints {
    XCTAssert(CGRectEqualToRect(self.testView.bounds, CGRectZero), @"View should have no dimensions yet.");
    
    NSArray<NSLayoutConstraint *> *constraints = [self.testView constraintsEqualToGuide:self.testViewController.view boundToAnchors:LayoutAnchorRelationFrame constant:0.0 priority:UILayoutPriorityRequired activate:YES];
    XCTAssert(constraints.count == 4, @"Insufficient constraints created");
    
    XCTAssert(!self.testView.translatesAutoresizingMaskIntoConstraints, @"Didn't automatically set translatesAutoresizingMaskIntoConstraints to NO");
    
    [self.testView setNeedsLayout];
    [self.testView layoutIfNeeded];
    
    XCTAssert(CGRectEqualToRect(self.testView.bounds, self.testViewController.view.bounds), @"Incorrect frame constraints: %@ vs. %@", NSStringFromCGRect(self.testView.bounds), NSStringFromCGRect(self.testViewController.view.bounds));
}

- (void)testOpposingConstraints {
    XCTAssert(CGRectEqualToRect(self.testView.bounds, CGRectZero), @"View should have no dimensions yet.");
    
    CGFloat horizontalInset = 8.0;
    CGFloat verticalInset = 4.0;
    NSArray<NSLayoutConstraint *> *horizontalConstraints = [self.testView opposingConstraintsForGuide:self.testViewController.view boundToAnchors:(LayoutAnchorRelationLeading | LayoutAnchorRelationTrailing) offset:horizontalInset priority:UILayoutPriorityRequired activate:YES];
    XCTAssert(horizontalConstraints.count == 2, @"Insufficient constraints created");
    
    NSArray<NSLayoutConstraint *> *verticalConstraints = [self.testView opposingConstraintsForGuide:self.testViewController.view boundToAnchors:(LayoutAnchorRelationTop | LayoutAnchorRelationBottom) offset:verticalInset priority:UILayoutPriorityRequired activate:YES];
    XCTAssert(verticalConstraints.count == 2, @"Insufficient constraints created");
    
    XCTAssert(!self.testView.translatesAutoresizingMaskIntoConstraints, @"Didn't automatically set translatesAutoresizingMaskIntoConstraints to NO");
    
    [self.testView setNeedsLayout];
    [self.testView layoutIfNeeded];
    
    CGRect insetRect = CGRectInset(self.testViewController.view.bounds, horizontalInset, verticalInset);
    XCTAssert(CGSizeEqualToSize(self.testView.bounds.size, insetRect.size), @"Incorrect opposing constraints: %@ vs. %@", NSStringFromCGSize(self.testView.bounds.size), NSStringFromCGSize(insetRect.size));
}

- (void)testConstantConstraint {
    XCTAssert(CGRectEqualToRect(self.testView.bounds, CGRectZero), @"View should have no dimensions yet.");
    
    CGSize size = CGSizeMake(100.0, 50.0);
    
    [self.testView constraintForAttribute:NSLayoutAttributeHeight constant:size.height priority:UILayoutPriorityRequired activate:YES];
    [self.testView constraintForAttribute:NSLayoutAttributeWidth constant:size.width priority:UILayoutPriorityRequired activate:YES];
    
    XCTAssert(!self.testView.translatesAutoresizingMaskIntoConstraints, @"Didn't automatically set translatesAutoresizingMaskIntoConstraints to NO");
    
    [self.testView setNeedsLayout];
    [self.testView layoutIfNeeded];
    
    XCTAssert(CGSizeEqualToSize(self.testView.bounds.size, size), @"Incorrect opposing constraints: %@ vs. %@", NSStringFromCGSize(self.testView.bounds.size), NSStringFromCGSize(size));
}

- (void)testChangingConstraintPriority {
    XCTAssert(CGRectEqualToRect(self.testView.bounds, CGRectZero), @"View should have no dimensions yet.");
    
    CGSize size = CGSizeMake(100.0, 50.0);
    
    [self.testView constraintForAttribute:NSLayoutAttributeHeight constant:size.height priority:UILayoutPriorityDefaultHigh activate:YES];
    [self.testView constraintForAttribute:NSLayoutAttributeWidth constant:size.width priority:UILayoutPriorityDefaultHigh activate:YES];
    
    XCTAssert(!self.testView.translatesAutoresizingMaskIntoConstraints, @"Didn't automatically set translatesAutoresizingMaskIntoConstraints to NO");
    
    [self.testView setNeedsLayout];
    [self.testView layoutIfNeeded];
    
    XCTAssert(CGSizeEqualToSize(self.testView.bounds.size, size), @"Incorrect opposing constraints: %@ vs. %@", NSStringFromCGSize(self.testView.bounds.size), NSStringFromCGSize(size));
}

@end
