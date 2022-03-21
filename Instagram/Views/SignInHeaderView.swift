//
//  SignInHeaderView.swift
//  Instagram
//
//  Created by Vinojen Gengatharan on 2022-03-21.
//

import Foundation
import UIKit

class SignInHeaderView : UIView
{
    //MARK: - System Called Functions
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
    }
    
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - UI Functions
    internal func createGradient()
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor]
        gradientLayer.frame = layer.bounds
        layer.addSublayer(gradientLayer)
    }
    
    
}
