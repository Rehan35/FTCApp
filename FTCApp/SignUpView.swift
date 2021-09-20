//
//  SignUpView.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/19/21.
//

import SwiftUI

struct SignUpView: View{
    let DARK_COLOR = "dark"
    let BRIGHT_COLOR  = "Yellow"
    
    @State var studentSignUp = false
    @State var signUpBarTitle = "Student"
    
    @State var maxCircleHeight : CGFloat = 0
    @EnvironmentObject var viewModel : AppViewModel
    var body: some View {
        Form{
            Section{
                NavigationLink(destination: StudentSignUpView(), label: {
                    HStack{
                        Text("Student")
                        Spacer()
                        Image(systemName: "person.circle.fill")
                    }
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                })
                
                NavigationLink(destination: TutorSignUpView(), label: {
                    HStack{
                        Text("Tutor")
                        Spacer()
                        Image(systemName: "person.crop.rectangle")
                    }
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                })
            }
        }
        .navigationBarTitle("Sign Up")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
