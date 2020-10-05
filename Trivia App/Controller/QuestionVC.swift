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
    
    var arrQuestion : [Question] = []
    var currentQuestIndext = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterQuestion()
       loadQuestion()
        
    }
    
    
    func filterQuestion()
    {
        arrQuestion =  QuestionData().arrQuestions.sorted {
            $0.order! < $1.order!
        }
    }
    
    
    func loadQuestion()  {
        let quest = arrQuestion[currentQuestIndext]
        lblQuestText.text = quest.ques
    }

   
  @IBAction  func btnNextClick( _ sender : UIButton)
    {
        currentQuestIndext  = currentQuestIndext + 1
        if arrQuestion.count >  currentQuestIndext
        {
          loadQuestion()
        }
    }

}
