//
//  CustomButton.swift
//  testAlo
//
//  Created by hamidurrahman on 13/05/19.
//  Copyright © 2019 hamidurrahman. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    override func prepareForInterfaceBuilder() {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
    
    // Event when the view changed size dynamically
    override var bounds: CGRect {
        didSet {
            // Update the gradient layer to fit new size
            gradientLayer.frame = bounds
        }
    }
}
