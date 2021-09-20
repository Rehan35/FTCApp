//
//  TutorHomeView.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/19/21.
//

import SwiftUI
import FirebaseAuth

struct TutorHomeView: View {
    @State var email : String = "rehanparwani@gmail.com"
    @EnvironmentObject var viewModel : AppViewModel
    var body: some View {
        Button(action:{
            Auth.auth().sendPasswordReset(withEmail: email, completion: {error in
                
            })
        }, label:{
            Text("Reset Password")
            Spacer()
            Image(systemName: "lock.circle")
        })
    }
}

struct TutorHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TutorHomeView()
    }
}
