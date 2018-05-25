//
//  LetterObjectView.swift
//  MatchMatch
//
//  Created by zhifeng on 5/24/18.
//  Copyright © 2018 Zhifeng. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class LetterObjectView: UIImageView {
    
    private var letterObject: LetterObject?
    
}

extension UIImageView {
    
    func enlargeAnimation(completion: @escaping () -> ())  {
        let animator = UIViewPropertyAnimator(
            duration: 0.5,
            curve: .linear ,
            animations: {
                self.center = self.superview!.center
                self.transform = CGAffineTransform.identity.scaledBy(x: 3.0, y: 3.0)
        })
        animator.addCompletion({ position in
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: 0.6,
                delay: 0, options: [],
                animations: {
                    self.transform = CGAffineTransform.identity.scaledBy(x: 0.1, y:0.1)
            }
            )
        })
        animator.addCompletion({ position in
            completion()
        })
        animator.startAnimation()
    }

}
