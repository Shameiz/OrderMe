//
//  UIViewControllerExtension.swift
//  OrderMe
//
//  Created by Shameiz Rangwala on 2018-05-08.
//  Copyright © 2018 CodeSchool. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentDetail (_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail () {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
