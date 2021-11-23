//
//  newEventVC.swift
//  Time Planner
//
//  Created by sanjithsethu on 20/11/21.
//
/*
 let today = Date()
 let formatter1 = DateFormatter()
 DateFormatter().dateStyle = .short
 print(DateFormatter().string(from: Date()))
 */

import SwiftUI

struct newEventVC: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var evente: [Event]
    @State var eventsss = Event(name: "",
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
                    TextField("Name", text: $eventsss.name).listRowSeparator(.visible)
                    
                    TextField("Location", text: $eventsss.Location).listRowSeparator(.visible)
                    
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
                    HStack {
                        Spacer()
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            evente.append(eventsss)
                        } label: {
                            Text("Save")
                                .foregroundColor(.blue)
                        }
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 60)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Discard events")
                                .foregroundColor(.red)
                        }
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 60)
                        Spacer()
                    }
                }
            }
            .navigationTitle("New events")
            .foregroundColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))
        }
    }
}

struct newEventVC_Previews: PreviewProvider {
    static var previews: some View {
        newEventVC(evente: .constant([]))
    }
}
