//
//  AppViewModel.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/18/21.
//

import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    var signedIn : Bool = false
    
    func signIn(email: String, password: String) -> Bool{
        auth.signIn(withEmail: email, password: password){ [weak self] result, error in
            
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.async{
                self?.signedIn = true
            }
        }
        if (self.signedIn){
            return true
        }
        return false
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password){ [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
        
    }
}
