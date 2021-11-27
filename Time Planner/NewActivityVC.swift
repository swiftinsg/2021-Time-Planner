//
//  EditActivity.swift
//  Time Planner
//
//  Created by sanjithsethu on 21/11/21.
//

import SwiftUI

struct NewActivityVC: View {
    @Environment(\.presentationMode) var presentationMode
    //@Binding var newActivity: Activity
    @State var newActivity = Activity(name1: "", timeSpending: 0, Percentage: "", Priority: "", minTime: 0 , maxTime: 0)
    var newlyMadeActivity: (Activity) -> Void
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Name")) {
                        TextField("Name", text: $newActivity .name1).listRowSeparator(.visible)
                    
                    }
                Section(header: Text("Time")) {
                    
//                    Slider(value: $newActivity.minTime,
//                                                  in: 0...60,
//                                                  step: 1)
//                    Slider(value: $newActivity.maxTime,
//                                                  in: 0...60,
//                                                  step: 1)
//                    TextField("Minimum Time", text: "\(newActivity.minTime)")
//                                .padding()
//                                .keyboardType(.decimalPad)
                    
                    Stepper(value: $newActivity.minTime, step: 1){
                        Text("Min Time: \(self.newActivity.minTime)")
                    }
                    
                    Stepper(value: $newActivity.maxTime, step: 1){
                        Text("Max Time: \(self.newActivity.maxTime)")
                    }
                }
                
                Section(header: Text("Priority")) {
                    
                    Picker("Priority", selection: $newActivity.Priority) {
                        Text("A Must Do").tag("A Must Do")
                        Text("High Priority").tag("High Priority")
                        Text("Medium Priority").tag("Medium Priority")
                        Text("Low Priority").tag("Low Priority")
                        Text("Very Low Priority").tag("Very Low Priority")
                        
                    }
                        }
                    
                
                Section {
                    HStack {
                        Spacer()
                        Button {
                            newlyMadeActivity(newActivity)
                            print(newActivity.Priority)
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Save")
                                .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                                .foregroundColor(.red)
                        }
                        Spacer()
                    }
                }
            }
            .navigationTitle("New events")
            .foregroundColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))
        }
    }
}

struct NewActivity_Previews: PreviewProvider {
    static var previews: some View {
        NewActivityVC(newlyMadeActivity: {_ in })
    }
}
