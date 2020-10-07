//
//  SummaryVC.swift
//  Trivia App
//
//  Created by Tejas on 06/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

class SummaryVC: UIViewController {

  
    @IBOutlet weak var lblName : UILabel!
    
    
    @IBOutlet weak var lblQuestion1 : UILabel!
    @IBOutlet weak var lblAns1 : UILabel!
    
    @IBOutlet weak var lblQuestion2 : UILabel!
    @IBOutlet weak var lblAns2 : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.setLightMode()
        navigationItem.title = "Summary"
        
        if let username = UserDefaults.standard.value(forKey: Global.UserDefaultKey.userNameKey) as? String
        {
            lblName.text = "Hello, \(username.capitalized)"
        }
        
        
    
        
        loadData()
        
    }
    
    func loadData()  {
        
        let q1 = QuestionData.shared.arrQuestions[0]
        
        lblQuestion1.text = String(format : "(Q:%@): %@", "\(q1.order!)", q1.ques!)
        
        lblAns1.text =    String(format : "Answer : %@",  q1.selectAns!)
        
        
        let q2 = QuestionData.shared.arrQuestions[1]
        
        lblQuestion2.text = String(format : "(Q:%@) : %@", "\(q2.order!)", q2.ques!)
        
        lblAns2.text =    String(format : "Answer : %@",  q2.selectAns!)
        
        
    }
    
    
        
    
 @IBAction   func btnHistoryClick( _ sender : UIButton)  {
     
     let vc =  storyboard?.instantiateViewController(withIdentifier: Global.StoryboardIdentifier.historyVC) as! HistoryVC
        
    navigationController?.pushViewController(vc, animated: true)
    
    }
   
    
    @IBAction   func btnFinishClick( _ sender : UIButton)  {
        
        let vc =  storyboard?.instantiateViewController(withIdentifier: Global.StoryboardIdentifier.viewController) as! ViewController
        
        self.setRootVC(vc: vc)
    
        
        
    }

}
