//
//  Student.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/16/21.
//

import Foundation

class Student: ObservableObject, Identifiable{
    @Published var studentFirstName : String = ""
    @Published var studentLastName : String = ""
    @Published var parentEmail : String = ""
    @Published var phoneNumber : Int = 0;
    @Published var timesAvailable : [Date] = [Date]()
    @Published var listOfSubjects : [String] = [String]()
    @Published var listOfTutors : [Tutor] = [Tutor]();
    @Published var numberOfHours : Int = 0;
    @Published var numberOfTutors : Int = 0;
    @Published var studentGrade : Int = 0;
    @Published var requiresMath : Bool = false;
    @Published var requiresEnglish : Bool = false;
    var studentId = UUID()
    
    init(firstName: String, lastName: String, parentEmail: String, phoneNumber: Int, requiresEnglish: Bool, requiresMath: Bool, numberOfHours: Int, numberOfTutors: Int, grade: Int){
        self.studentFirstName = firstName
        self.studentLastName = lastName
        self.parentEmail = parentEmail
        self.phoneNumber = phoneNumber
        self.requiresEnglish = requiresEnglish
        self.requiresMath = requiresMath
        self.numberOfHours = numberOfHours
        self.numberOfTutors = numberOfTutors
        self.studentGrade = grade
    }
    
    func numberOfTutors() -> Int{
        return self.listOfTutors.count

}
