//
//  LetterObjectViewBehavior.swift
//  MatchMatch
//
//  Created by zhifeng on 5/24/18.
//  Copyright © 2018 Zhifeng. All rights reserved.
//

import Foundation
import UIKit

class LetterObjectViewBehavior: UIDynamicBehavior {
    
    lazy var collisionBehavior: UICollisionBehavior = {
        let behavior = UICollisionBehavior()
        behavior.translatesReferenceBoundsIntoBoundary = true
        return behavior
    }()
    
    lazy var itemBehavior: UIDynamicItemBehavior = {
        let behavior = UIDynamicItemBehavior()
        behavior.allowsRotation = false
        behavior.elasticity = Constants.itemBehaviorElasticity
        behavior.resistance = Constants.itemBehaviorResistance
        behavior.friction = Constants.itemBehaviorFriction
        return behavior
    }()
    
    func push(_ item: UIDynamicItem) {
        let push = UIPushBehavior(items: [item], mode: .instantaneous)
        push.angle = (CGFloat.pi/2).arc4random
        push.magnitude = CGFloat(Constants.pushBehaviorMagnitudeMinimum) + CGFloat(Constants.pushBehaviorMagnitudeRandomFactor).arc4random
        push.action = { [unowned push, weak self] in
            self?.removeChildBehavior(push)
        }
        addChildBehavior(push)
    }
    
    func addItem(_ item: UIDynamicItem) {
        collisionBehavior.addItem(item)
        itemBehavior.addItem(item)
        push(item)
    }
    
    func removeItem(_ item: UIDynamicItem) {
        collisionBehavior.removeItem(item)
        itemBehavior.removeItem(item)
    }
    
    override init() {
        super.init()
        addChildBehavior(collisionBehavior)
        addChildBehavior(itemBehavior)
    }
    
    convenience init(in animator: UIDynamicAnimator) {
        self.init()
        animator.addBehavior(self)
    }
    
}

extension CGFloat {
    var arc4random: CGFloat {
        return self * (CGFloat(arc4random_uniform(UInt32.max))/CGFloat(UInt32.max))
    }
}
