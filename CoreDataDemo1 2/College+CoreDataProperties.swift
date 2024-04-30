//
//  College+CoreDataProperties.swift
//  CoreDataDemo1
//
//  Created by STUDENT on 4/25/24.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?
    @NSManaged public var student_rel: NSSet?

}

// MARK: Generated accessors for student_rel
extension College {

    @objc(addStudent_relObject:)
    @NSManaged public func addToStudent_rel(_ value: Student)

    @objc(removeStudent_relObject:)
    @NSManaged public func removeFromStudent_rel(_ value: Student)

    @objc(addStudent_rel:)
    @NSManaged public func addToStudent_rel(_ values: NSSet)

    @objc(removeStudent_rel:)
    @NSManaged public func removeFromStudent_rel(_ values: NSSet)

}

extension College : Identifiable {

}
