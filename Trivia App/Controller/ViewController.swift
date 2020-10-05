//
//  ViewController.swift
//  Trivia App
//
//  Created by Tejas on 05/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtName : MyTestField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


  @IBAction  func btnNextClick(sender : UIButton)  {
        
    if (txtName.text?.isEmpty ?? true)
    {
        UIAlertController.showAlert("Please enter name", vc: self)
        return
    }
    
    
    if (txtName.text?.count ?? 0) > 20 ||  (txtName.text?.count ?? 0) < 5
    {
         UIAlertController.showAlert("Name filed character must be 5 to 20", vc: self)
        return
    }
    
    let text = txtName.text ?? ""
    let test =  text.range(of: "[^a-zA-Z]", options: .regularExpression)
    
    if test != nil
    {
        UIAlertController.showAlert("Name filed must be use alphabets", vc: self)
    }
    
    
    
    }
    
    
}

