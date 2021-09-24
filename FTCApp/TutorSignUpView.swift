//
//  TutorSignUpView.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/19/21.
//

import SwiftUI

struct TutorSignUpView: View{
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
    
    @State var showSignInView : Bool = false
    
    let dayList : [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    @EnvironmentObject var viewModel : AppViewModel
    @State var listOfDatesAvailable = [String]();
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
            Section(header: Text("Tutor Information")){
                TextField("Number of Hours", text: $numberOfHours)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(DARK_COLOR))
                    .padding(.top, 5)
                    .keyboardType(.numberPad)
                NavigationLink(destination: AddAvailableDateView(listOfDatesAvailable: $listOfDatesAvailable), label:{
                    Text("Add Avaible Times")
                        .font(.system(size: 15, weight: .semibold))
                    Spacer()
                    Image(systemName: "calendar.badge.plus")
                })
            }
            
            Section(header: Text("Account Information")){
                TextField("Phone Number: (123)-456-7890", text: $phoneNumber)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(DARK_COLOR))
                    .padding(.top, 5)
                    .keyboardType(.numberPad)
                TextField("Email: example@gmail.com", text: $email)
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
        .navigationBarTitle("Tutor Sign Up")
        Button(action: {
            guard !email.isEmpty && !password.isEmpty else{
                return
            }
            viewModel.signUp(email: email, password: password)
            showSignInView = true
        }, label:{
            Text("Sign Up")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(.blue))
                .padding(.leading, 5)
        })
        .fullScreenCover(isPresented: $showSignInView, content: SignInView.init)
    }
}

struct TutorSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        TutorSignUpView()
    }
}
