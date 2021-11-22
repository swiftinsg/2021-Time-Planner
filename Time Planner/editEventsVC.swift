//
//  editEvents.swift
//  Time Planner
//
//  Created by sanjithsethu on 21/11/21.
//

import SwiftUI

struct editEvents: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var event: [Event]
    @State var eventss = Event(name: "",
                               Location: "",
                               date: "",
                               time: "")
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Information")) {
                    TextField("Name", text: $eventss.name).listRowSeparator(.visible)
                    
                    //       Spacer().listRowSeparator(.hidden)
                    
                    TextField("Location", text: $eventss.Location).listRowSeparator(.visible)
                    
                    //Spacer()
                    
                    //   Text("Date and time:").listRowSeparator(.hidden)
                    
                    DatePicker(
                        "Date",
                        selection: $date,
                        in: dateRange,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .font(.system(size: 18))
                        .foregroundColor(Color(red: 0.796, green: 0.796, blue: 0.805))
                        .padding(.bottom)
                    
                }
                
                Section {
                    Button("Save") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.blue)
                    
                    Button("Discard events") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("New events")
            .foregroundColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))
        }
    }
}

struct editEvents_Previews: PreviewProvider {
    static var previews: some View {
        editEvents(event: .constant([]))
    }
}
