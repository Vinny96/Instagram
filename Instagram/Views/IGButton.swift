//
//  IGButton.swift
//  Instagram
//
//  Created by Vinojen Gengatharan on 2022-04-09.
//

import UIKit

class IGButton: UIButton
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        backgroundColor = UIColor.systemBlue
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
