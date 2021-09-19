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
        //NavigationView{
            VStack{
                if studentSignUp{
                    StudentSignUpView()
                }else{
                    TutorSignUpView()
                }
            }
//            .navigationBarTitle("\(signUpBarTitle) Sign Up")
//            .navigationBarItems(trailing:
//                HStack{
//                    Menu{
//                        Button("Student"){
//                            studentSignUp = true
//                            signUpBarTitle = "Student"
//                        }
//                        Button("Tutor"){
//                            studentSignUp = false
//                            signUpBarTitle = "Tutor"
//                        }
//                    } label: {
//                        Image(systemName: "person.circle")
//                    }
//                }
//            )
        //}
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
