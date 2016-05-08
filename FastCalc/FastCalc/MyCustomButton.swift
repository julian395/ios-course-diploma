//
//  MyCustomButton.swift
//  FastCalc
//
//  Created by Julian1 on 08.05.16.
//  Copyright © 2016 juliankob.com. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class MyCustomButton : UIButton {
    /// Толщина границы
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    /// Цвет границы
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.CGColor }
        get { return layer.borderColor?.UIColor }
    }
    /// Радиус границы
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius  }
    }
}

extension CGColor {
    private var UIColor: UIKit.UIColor {
        return UIKit.UIColor(CGColor: self)
    }
}