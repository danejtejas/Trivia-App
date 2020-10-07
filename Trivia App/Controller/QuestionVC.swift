//
//  QuestionVC.swift
//  Trivia App
//
//  Created by Tejas on 05/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {

    @IBOutlet weak var lblQuestText : UILabel!
    
    @IBOutlet weak var radBtnOp1: RadioButton!
    
    
    @IBOutlet weak var radBtnOp2: RadioButton!
    
    @IBOutlet weak var radBtnOp3: RadioButton!
    
    @IBOutlet weak var radBtnOp4 : RadioButton!
    
    
    
    
    @IBOutlet weak var radioButtonGroup: RadioButtonContainerView!
    
     var selectedOption = ""
    
   
    var currentQuestIndext = 0
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLightMode()
        
        filterQuestion()
        loadQuestion()
        
        
        radBtnOp1.radioCircle = RadioButtonCircleStyle.init(outerCircle: 23, innerCircle: 10, outerCircleBorder: 2, contentPadding: 10)
        
        radBtnOp2.radioCircle = RadioButtonCircleStyle.init(outerCircle: 23, innerCircle: 10, outerCircleBorder: 2, contentPadding: 10)
        
        radBtnOp3.radioCircle = RadioButtonCircleStyle.init(outerCircle: 23, innerCircle: 10, outerCircleBorder: 2, contentPadding: 10)
        
        radBtnOp4.radioCircle = RadioButtonCircleStyle.init(outerCircle: 23, innerCircle: 10, outerCircleBorder: 2, contentPadding: 10)
        
        radioButtonGroup.buttonContainer.delegate = self
        radioButtonGroup.buttonContainer.setEachRadioButtonColor {
            return RadioButtonColor(active: $0.tintColor , inactive: $0.tintColor)
        }
        
    }
    
    
    func filterQuestion()
    {
       
        QuestionData.shared.arrQuestions =    QuestionData.shared.arrQuestions.sorted {
            $0.order! < $1.order!
        }
        
       
        
    }
    
    
    func loadQuestion()  {
        let quest =   QuestionData.shared.arrQuestions[currentQuestIndext]
        lblQuestText.text =  "(Q:\(quest.order!)) : " + quest.ques!
        
        navigationItem.title = "Question No \(currentQuestIndext + 1)"
        
        radBtnOp1.setTitle(  "(A) " + quest.option1!, for: .normal)
         radBtnOp2.setTitle( "(B) " + quest.option2!, for: .normal)
         radBtnOp3.setTitle( "(C) " + quest.option3!, for: .normal)
        radBtnOp4.setTitle(  "(D) " + quest.option4!, for: .normal)
        
    }

   
  @IBAction  func btnNextClick( _ sender : UIButton)
    {
        
        if selectedOption == ""
        {
            UIAlertController.showAlert("Please select any of one option.", vc: self)
            return
        }
        
        QuestionData.shared.arrQuestions[currentQuestIndext].selectAns = selectedOption
        currentQuestIndext  = currentQuestIndext + 1
        
        if   QuestionData.shared.arrQuestions.count >  currentQuestIndext
        {
            
            let que2VC = self.storyboard?.instantiateViewController(withIdentifier: Global.StoryboardIdentifier.question2VC) as! Question2VC
           
            que2VC.currentIndext = currentQuestIndext
            
            self.setRootVC(vc: que2VC)
            
        }
    }

}


extension QuestionVC : RadioButtonDelegate {
    
    func radioButtonDidSelect(_ button: RadioButton) {
        
        let quest = QuestionData.shared.arrQuestions[currentQuestIndext]
        
        switch button.tag {
        case 1:
            selectedOption = quest.option1!
        case 2:
            selectedOption = quest.option2!
        case 3:
            selectedOption = quest.option3!
        case 4:
            selectedOption = quest.option4!
        default: break
            
        }
        
    }
    
    func radioButtonDidDeselect(_ button: RadioButton) {
        
        
    }
}
