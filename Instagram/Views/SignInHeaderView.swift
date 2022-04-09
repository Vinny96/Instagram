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
    //MARK: - Variables
    private var gradientLayer : CALayer?
    
    
    
    //MARK: - System Called Functions
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        clipsToBounds = true
        createGradient()
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        gradientLayer?.frame = layer.bounds
        
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
        layer.addSublayer(gradientLayer)
        self.gradientLayer = gradientLayer
    }
    
    
}
//MARK: - Notes
/**
 So lets explain what is happening here with the gradient layer. Notice here how for gthe gradient layer we are doing gradientLayer?.frame = layer.bounds . So the reason why we are doing this is because we want the gradientLayer to occupy the entire layer. So the layer.bounds is going to be whatever the the bounds of whatever the frame of this view is when we instantiate it. Hence why the gradient layer takes up the entire headerView and this is due to this line of code gradientLayer?.frame = layer.bounds
 
 
 */
