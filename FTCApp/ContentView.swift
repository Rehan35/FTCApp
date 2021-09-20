//
//  ContentView.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/16/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : AppViewModel
    var body: some View {
        SignInView()
            .onAppear{
                viewModel.signedIn = false
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
