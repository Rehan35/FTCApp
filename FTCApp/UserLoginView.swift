//
//  UserLoginView.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/18/21.
//

import SwiftUI

struct UserLoginView: View {
    let DARK_COLOR = "dark"
    let BRIGHT_COLOR  = "Yellow"
    
    @State var email = ""
    @State var password = ""
    
    @State var maxCircleHeight : CGFloat = 0
    var body: some View {
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
                
                Button(action: {}, label:{
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
            .padding(.top, -maxCircleHeight/1.6)
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct UserLoginView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginView()
    }
}

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
