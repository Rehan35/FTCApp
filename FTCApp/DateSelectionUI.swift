//
//  DateSelectionUI.swift
//  FTCApp
//
//  Created by Viresh Pati on 9/19/21.
//

import SwiftUI

struct CheckBoxView: View {
    @State var checked: Bool = false

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}
