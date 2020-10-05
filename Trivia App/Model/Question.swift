//
//  Question.swift
//  Trivia App
//
//  Created by Tejas on 05/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import Foundation


class  Question : NSObject {
    
    var order : Int?
    var ques : String?
    var option1 : String?
    var option2 : String?
    var option3 : String?
    var option4 : String?
    var isAllowMultipleSelect : Bool = false
    
    override init() {
        super.init()
       
        
    }
    
    init( order : Int , questText : String, op1 : String,    op2 : String,  op3 : String,  op4 : String , isAllowMultipleSelect : Bool ) {
        
        self.order = order
        self.ques = questText
        option1 = op1
        option2 = op2
        option3 = op3
        option4 = op4
        self.isAllowMultipleSelect = isAllowMultipleSelect
        
    }
    
    
}



class QuestionData : NSObject  {
    
    var arrQuestions : [Question] = []
    
    override init() {
        
      
        
        let question1 = Question()
        question1.order = 1
        question1.ques =  "Who is the best cricketer in the world?"
        question1.option1 = "Sachin Tendulkar"
        question1.option2 = "Virat Kolli"
        question1.option3 = "Adam Gilchirst"
        question1.option4 = "Jacques Kallis"
        question1.isAllowMultipleSelect = false
        
        arrQuestions.append(question1)
        
        
        let question2 = Question()
        question2.order = 2
        question2.ques =  "What are the colors in the Indian national flag?"
        question2.option1 = "White"
        question2.option2 = "Yellow"
        question2.option3 = "Orange"
        question2.option4 = "Green"
        question2.isAllowMultipleSelect = false
        
        arrQuestions.append(question2)
              
        
        
    }
    
}
