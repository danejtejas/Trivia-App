//
//  MyTestField.swift
//  Trivia App
//
//  Created by Tejas on 05/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

class MyTestField: UITextField {

    
    var lineView : UIView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
       setup()
        
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setup()
          
    }
    
    
    override func layoutSubviews() {
        
        lineView.frame = CGRect(x: 0, y: bounds.height - 1, width: bounds.width, height: 1)
        
    }
    
    
    func setup()  {
        
        font = UIFont(name: "Avenir-Medium", size: 17)
        
        lineView = UIView()
        lineView.backgroundColor = .gray
        addSubview(lineView)
        
    }
    
    
    let padding = UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 5)
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
     
        return bounds.inset(by: padding)
        
    }
    
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        editingRect(forBounds: bounds)
        
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
          editingRect(forBounds: bounds)
    }
    

}
