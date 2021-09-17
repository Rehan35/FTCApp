//
//  Tutor.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/16/21.
//

import Foundation

class Tutor: ObservableObject, Identifiable{
    @Published var tutorFirstName : String = ""
    @Published var tutorLastName : String = ""
    @Published var email : String = ""
    @Published var phoneNumber : Int = 0;
    @Published var timesAvailable : [Date] = [Date]()
    @Published var listOfSubjects : [String] = [String]()
    @Published var numberOfHours : Int = 0;
    @Published var listOfStudents : [Student] = [Student]();
    var tutorId = UUID()
    
    init(firstName: String, lastName: String, parentEmail: String, phoneNumber: Int, requiresEnglish: Bool, requiresMath: Bool, numberOfHours: Int){
        self.tutorFirstName = firstName
        self.tutorLastName = lastName
        self.email = parentEmail
        self.phoneNumber = phoneNumber
        var subjects: [String] = [String]()
        
        if requiresMath{
            subjects.append("Math")
        }
        if requiresEnglish{
            subjects.append("English")
        }
        self.numberOfHours = numberOfHours
    }
    
    func numberOfStudents() -> Int{
        return self.listOfStudents.count
    }
    
    
}
