//
//  HistoryVC.swift
//  Trivia App
//
//  Created by Tejas on 06/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit
import CoreData


class HistoryVC: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var arrQuestionInfo : [QuestionInfo] = []
    
    
    var lblError : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "History"
        configErrorLable()
        
        
        tableView.allowsSelection = false
        
        tableView.tableFooterView = UIView()
        
        tableView.dataSource = self
        tableView.delegate = self
        getQuestionInfo()
    }
    

    func configErrorLable()  {
        
    }
    
    
    func getQuestionInfo()  {
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        do
        {
             arrQuestionInfo  =  try context.fetch( QuestionInfo.fetchRequest()) as! [QuestionInfo]
            tableView.reloadData()
        }
        catch
        {
            
        }
        
    }
   

}


extension HistoryVC : UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrQuestionInfo.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryCell
        
        let que = arrQuestionInfo[indexPath.section]
        
        cell.lblName.text = "Name: " + que.name!.capitalized
        
        cell.lblQ1.text =  "(Q:1): " +  que.que1!
        cell.lblAns1.text = "Answer: " + que.ans1!
        
        cell.lblQ2.text =  "(Q:2): " +  que.que2!
        cell.lblAns2.text = "Answer: " + que.ans2!
        cell.lblGameTime.text =  "GAME 1: " + (que.date?.myFormate())!
        
        return cell
    }
    
    
}



extension HistoryVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let f = UIView()
        f.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        return f
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}
