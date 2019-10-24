//
//  GeneralExtension.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

extension UIView {
    
    // Circular Object
    func roundedView(withHeight h: CGFloat = 0) {
        self.layer.masksToBounds = false
        
        var height: CGFloat
        if h == 0 {
            height = self.frame.height/2
        } else {
            height = h/2
        }
        
        self.layer.cornerRadius = height
        self.clipsToBounds = true
    }
    
}

// UIView Anchor Extension
extension UIView {

    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        }
        
        return self.topAnchor
    }

    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leadingAnchor
        }
        
        return self.leftAnchor
    }

    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.trailingAnchor
        }
        
        return self.rightAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        }
        
        return self.bottomAnchor
    }
    
    var safeCenterXAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerXAnchor
        }
        
        return self.centerXAnchor
    }
    
    var safeCenterYAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerYAnchor
        }
        
        return self.centerYAnchor
    }
    
}


enum COLOR: Int {
    case kDEFAULT = -1 // for default
    
    case kORANGE = 0xFF8C00
}

extension UIColor {
    
    static let orangeColor = hex(.kORANGE)
    
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    // changing the colors by hex to rgb
    static func hex(_ h: COLOR, alpha a: CGFloat = 1) -> UIColor {
        let red = CGFloat((h.rawValue >> 16) & 0xFF)
        let green = CGFloat((h.rawValue >> 8) & 0xFF)
        let blue = CGFloat(h.rawValue & 0xFF)
        let alpha = CGFloat((a))
        
        return rgba(red, green, blue, alpha)
    }
    
}


extension String {
    
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,3}$").evaluate(with: self)
    }
    
}

extension UIApplication {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        // check if the controller under NAVIGATION
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        // check if the controller under TAB
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        
        // get the presented view controller
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
    
    class func topNavigationController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UINavigationController? {
        if let navigationController = controller as? UINavigationController {
            return navigationController
        }
        
        print("unexpected happend, could not get any NAVIGATION... Please double check the structure")
        return nil // it means we don't get any NAVIGATION
    }

}

//MARK: - PUSH & POP FROM NAVIGATION VIEW CONTROLLER
func push(withReference ref: UIViewController? = UIApplication.topViewController(),
          controller c: UIViewController,
          animated: Bool = true,
          completion: (() -> ())? = nil) {
    guard let nav = ref?.navigationController else {
        print("navigation controller is nil")
        
        return
    }
    
    nav.pushViewController(c, animated: animated)
    nav.transitionCoordinator?.animate(alongsideTransition: nil, completion: { _ in
        if let completion = completion {
            completion()
        }
    })
}

func pop(withReference ref: UIViewController? = UIApplication.topViewController(),
         withRepetition r: Int = 0,
         animated: Bool = true,
         completion: (() -> ())? = nil) {
    guard let nav = ref?.navigationController else {
        print("navigation controller is nil")
        
        return
    }
    
    nav.popViewController(animated: animated)
    nav.transitionCoordinator?.animate(alongsideTransition: nil, completion: { _ in
        if let completion = completion {
            completion()
        }
    })
}
