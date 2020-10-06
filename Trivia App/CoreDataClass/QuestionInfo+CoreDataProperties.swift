//
//  QuestionInfo+CoreDataProperties.swift
//  Trivia App
//
//  Created by Tejas on 06/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//
//

import Foundation
import CoreData


extension QuestionInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionInfo> {
        return NSFetchRequest<QuestionInfo>(entityName: "QuestionInfo")
    }

    @NSManaged public var name: String?
    @NSManaged public var que1: String?
    @NSManaged public var ans1: String?
    @NSManaged public var que2: String?
    @NSManaged public var ans2: String?
    @NSManaged public var date: Date?

}
