//
//  AppViewModel.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/18/21.
//

import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    @Published var signedIn : Bool = false
    
    func signIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
            
            if error != nil{
                print(error)
                return
            }else{
                self.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
        }
    }
}
