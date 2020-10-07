//
//  Question2VC.swift
//  Trivia App
//
//  Created by Tejas on 06/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit
import CoreData

class Question2VC: UIViewController {

    
    var question : Question?
    
    var currentIndext : Int = 0
    
    @IBOutlet weak var lblQuestText  : UILabel!
    
    @IBOutlet weak var chkBtnOp1 : CheckboxButton!
    @IBOutlet weak var chkBtnOp2 : CheckboxButton!
    @IBOutlet weak var chkBtnOp3 : CheckboxButton!
    @IBOutlet weak var chkBtnOp4 : CheckboxButton!
  
    @IBOutlet weak var checkBoxGroup   : CheckboxButtonContainerView!
    
    var arrSelectd : [String] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

            self.setLightMode()
        
        checkBoxGroup.buttonContainer.delegate = self
        checkBoxGroup.buttonContainer.setEachCheckboxButtonColor {
            return CheckBoxColor(activeColor: $0.tintColor, inactiveColor: UIColor.clear, inactiveBorderColor: $0.tintColor, checkMarkColor: UIColor.white)
        }
        
         loadQuestion()
        
    }
    
    
    func loadQuestion()  {
        
        
        question = QuestionData.shared.arrQuestions[currentIndext]
        
        guard let ques = question else { return  }
        
        navigationItem.title = "Question No \(ques.order!)"
        
        lblQuestText.text = "(Q:\(ques.order!)) : " + ques.ques!
        
        chkBtnOp1.setTitle( "(A) " + ques.option1!, for: .normal)
        chkBtnOp2.setTitle( "(B) " + ques.option2!, for: .normal)
        chkBtnOp3.setTitle( "(C) " + ques.option3!, for: .normal)
        chkBtnOp4.setTitle( "(D) " + ques.option4!, for: .normal)
        
        
    }
    
    
   @IBAction func btnNextClick( _ sender : UIButton)  {
     
    if  arrSelectd.count < 2
    {
        UIAlertController.showAlert("Please select more than 1 option", vc: self)
        return
    }
    
     question?.selectAns = arrSelectd.joined(separator: ";")
    saveData()
    let summaryVC = self.storyboard?.instantiateViewController(withIdentifier: Global.StoryboardIdentifier.summaryVC) as! SummaryVC
    self.setRootVC(vc: summaryVC)
    
    
    }

    
    
    
    /// this func use to save data in local data base
    func saveData()  {
        
        let appDel = UIApplication.shared.delegate  as! AppDelegate
        let manageObjectContext = appDel.persistentContainer.viewContext
      
        let objQue = NSEntityDescription.insertNewObject(forEntityName: "QuestionInfo", into: manageObjectContext) as! QuestionInfo
        
        let q1 = QuestionData.shared.arrQuestions[0]
        
        objQue.name = UserDefaults.standard.value(forKey: Global.UserDefaultKey.userNameKey) as? String
        objQue.date = Date()

        objQue.que1 = q1.ques
        objQue.ans1 = q1.selectAns
        
    
        let q2 = QuestionData.shared.arrQuestions[1]
        
        objQue.que2 = q2.ques
        objQue.ans2 = q2.selectAns
        
        do
        {
            try manageObjectContext.save()
        }
        catch
        {
            UIAlertController.showAlert("Data not save somthing error", vc: self)
        }
        
        
    }
    
    
    func getSelectedOrDeleOption( _ button : CheckboxButton ) -> String?
    {
        switch button.tag {
        case 1:
            return question!.option1!
        case 2:
            return question!.option2!
        case 3:
            return question!.option3!
        case 4:
            return question!.option4!
        default:
            break
        }
        return nil
    }

}


extension Question2VC : CheckboxButtonDelegate {
    
    func chechboxButtonDidSelect(_ button: CheckboxButton) {
        
        if let selected = getSelectedOrDeleOption(button)
        {
            arrSelectd.append(selected)
        }
    }
    
    func chechboxButtonDidDeselect(_ button: CheckboxButton) {
       
        if arrSelectd.count > 0
        {
            if let deselected = getSelectedOrDeleOption(button)
            {
                
                
                arrSelectd.remove(at: arrSelectd.firstIndex(of: deselected)!)
            }
        }
       
    }
    
    
}
