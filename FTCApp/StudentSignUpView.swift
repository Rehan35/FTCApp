//
//  StudentSignUpView.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/19/21.
//

import SwiftUI

struct StudentSignUpView: View{
    let DARK_COLOR = "dark"
    let BRIGHT_COLOR  = "Yellow"
    
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var requestsMath : Bool = false
    @State var requestsEnglish : Bool = false
    @State var numberOfHours : String = ""
    @State var grade : String = ""
    @State var phoneNumber : String = ""
    @State var email : String = ""
    @State var password : String = ""
    var body: some View{
        Form{
            Section(header: Text("Personal Information")){
                VStack(alignment: .leading, spacing: 8, content: {
                    TextField("First Name", text: $firstName)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(DARK_COLOR))
                        .padding(.top, 5)
                                
                    Divider()
                    
                    TextField("Last Name", text: $lastName)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(DARK_COLOR))
                        .padding(.top, 5)
                })
            }
            Section(header: Text("Student Information")){
                TextField("Grade", text: $grade)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(DARK_COLOR))
                    .padding(.top, 5)
                    .keyboardType(.numberPad)

                TextField("Hours", text: $numberOfHours)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(DARK_COLOR))
                    .padding(.top, 5)
                    .keyboardType(.numberPad)
            }
            
            Section(header: Text("Account Information")){
                TextField("Phone Number: (123)-456-7890", text: $phoneNumber)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(DARK_COLOR))
                    .padding(.top, 5)
                    .keyboardType(.numberPad)
                TextField("Parent Email: example@gmail.com", text: $email)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(DARK_COLOR))
                    .padding(.top, 5)
                SecureField("Password", text: $password)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(DARK_COLOR))
                    .padding(.top, 5)
            }
            
            Section(header: Text("Subjects")){
                Toggle("Math", isOn: $requestsMath)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(DARK_COLOR))
                    .padding(.top, 5)
                
                Toggle("English", isOn: $requestsEnglish)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(DARK_COLOR))
                    .padding(.top, 5)
            }
        }
        Button(action: {}, label:{
            Text("Sign Up")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color(.blue))
                .padding(.leading, 5)
        })
    }
}

struct StudentSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        StudentSignUpView()
    }
}
