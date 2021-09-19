//
//  SignInView.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/19/21.
//

import SwiftUI

struct SignInView: View{
    let DARK_COLOR = "dark"
    let BRIGHT_COLOR  = "Yellow"
    
    @State var email = ""
    @State var password = ""
    
    @State var maxCircleHeight : CGFloat = 0
    
    @State var showSignUpView = false
    @EnvironmentObject var viewModel : AppViewModel
    var body: some View {
        if showSignUpView{
            SignUpView()
        }else{
            VStack{
                
                GeometryReader{proxy -> AnyView in
                    
                    let height = proxy.frame(in: .global).height
                    
                    DispatchQueue.main.async{
                        if maxCircleHeight == 0{
                            maxCircleHeight = height
                        }
                    }
                    
                    return AnyView(
                        ZStack{
                            Circle()
                                .fill(Color(DARK_COLOR))
                                .offset(x: getRect().width/2, y: -height/1.3)
                            Circle()
                                .fill(Color(DARK_COLOR))
                                .offset(x: -getRect().width/2, y: -height/1.5)
                            Circle()
                                .fill(Color(BRIGHT_COLOR))
                                .offset(y: -height/1.3)
                                .rotationEffect(.init(degrees: -5))
                        }
                    )
                }
                .frame(maxHeight: getRect().width)
                
                VStack{
                    Text("Sign In")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(DARK_COLOR))
                        .kerning(1.9)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("User Name")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                        
                        TextField("Email", text: $email)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color(DARK_COLOR))
                            .padding(.top, 5)
                        
                        Divider()
                    })
                    .padding(.top, 25)
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Password")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                        
                        SecureField("Password", text: $password)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color(DARK_COLOR))
                            .padding(.top, 5)
                        
                        Divider()
                    })
                    .padding(.top, 20)
                    
                    Button(action:{}, label:{
                        Text("Forgot Password?")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 10)
                    
                    Button(action: {
                        guard !email.isEmpty && !password.isEmpty else{
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                        if (viewModel.auth.currentUser != nil){
                            showSignUpView = true
                        }
                    }, label:{
                        Image(systemName: "arrow.right")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(DARK_COLOR))
                            .clipShape(Circle())
                        
                            .shadow(color: Color(BRIGHT_COLOR).opacity(0.6), radius: 5, x: 0, y: 0)
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                }
                .padding()
                .padding(.top, -maxCircleHeight/2.5)
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .environmentObject(viewModel)
            .overlay(
                HStack{
                    Text("New Member")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Button(action:{showSignUpView = true}, label:{
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundColor(Color(BRIGHT_COLOR))
                    })
                }
                ,alignment: .bottom
            )
            .background(
                
                HStack{
                    
                    Circle()
                        .fill(Color(BRIGHT_COLOR))
                        .frame(width: 71, height: 71)
                        .offset(x: -30, y: 0)
                    
                    Spacer(minLength: 0)
                    
                    Circle()
                        .fill(Color(DARK_COLOR))
                        .frame(width: 110, height: 110)
                        .offset(x: 40, y: 20)
                    
                }
                .offset(y: getSafeArea().bottom + 30)
                , alignment: .bottom
                
            )
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
