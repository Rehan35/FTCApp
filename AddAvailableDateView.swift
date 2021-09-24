//
//  AddAvailableDateView.swift
//  FTCApp
//
//  Created by Rehan Parwani on 9/20/21.
//

import SwiftUI

struct AddAvailableDateView: View {
    @Binding var listOfDatesAvailable : [String]
    @State var dayList : [String : Bool] = ["Monday" : false, "Tuesday" : false, "Wednesday" : false, "Thursday" : false, "Friday" : false,
                                     "Saturday" : false, "Sunday" : false]
    
    @State var startDate = Date()
    @State var endTime = Date()
    var body: some View {
        let keys = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        Form{
            Section(header: Text("Current Times")){
                ForEach(listOfDatesAvailable, id: \.self){ string in
                    Text(string)
                }
            }
            Section(header: Text("Days")){
                ForEach(keys, id: \.self){ day in
                    Button(action:{
                        dayList[day] = !dayList[day]!
                    }, label:{
                        HStack{
                            Text("\(day)")
                                .foregroundColor(.black)
                                .font(.headline)
                            Spacer()
                            if dayList[day] == true{
                                Image(systemName: "checkmark.circle")
                            }
                        }
                    })
                }
            }
            
            Section(header: Text("Times")){
                DatePicker("Start Time", selection: $startDate, displayedComponents: .hourAndMinute)
                    .font(.headline)
                DatePicker("End Time", selection: $startDate, displayedComponents: .hourAndMinute)
                    .font(.headline)
            }
            
            Section(){
                Button(action:{listOfDatesAvailable.append("A")}, label:{
                    HStack{
                        Text("Add Time")
                        Spacer()
                        Image(systemName: "plus")
                    }
                    .font(.headline)
                })
            }
        }
        .navigationBarTitle("Times Available")
    }
}

