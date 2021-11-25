//
//  startTimeVC.swift
//  Time Planner
//
//  Created by sanjithsethu on 20/11/21.
//

import SwiftUI
let fmt = ISO8601DateFormatter()

let date1 = fmt.date(from: "2017-08-06T19:20:42+0000")!
let date2 = fmt.date(from: "2020-08-06T19:20:46+0000")!

let diffs = Calendar.current.dateComponents([.year, .month, .day], from: date1, to: date2)
//print(diffs)

struct startTimeVC: View {
    
    
    
    init(setsa: Binding<[activitySets]>) {
        self._setsa = setsa
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color(red: 0.4627450980392157, green: 0.4235294117647059, blue: 0.8196078431372549))]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))]
    }
    @Binding var setsa: [activitySets]
    
    @State private var date = Date()
    @State private var date1 = Date()

    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
     
            VStack(alignment:.leading){
                //                Text("Hello,")
                //                    .fontWeight(.heavy)
                //                    .foregroundColor(Color(red: 0.4627450980392157, green: 0.4235294117647059, blue: 0.8196078431372549))
                //                    .multilineTextAlignment(.leading)
                //                   .font(.system(size: 50))
                //                   .padding(.all)
                
                Text("")
                
                Text("When would you like to start getting ready?")
                    .foregroundColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))
                    .font(.system(size: 20))
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
          //      Text("")
           //    Text("")
               // Text("")
                //    Text("")
                
                DatePicker(
                    "",
                    selection: $date,
                    in: dateRange,
                    displayedComponents: [.hourAndMinute]
                ).datePickerStyle(WheelDatePickerStyle())
                    .padding([.bottom, .trailing])
                    .font(.system(size: 13))
                    .foregroundColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))
                    .frame(minWidth: 60, maxWidth: .infinity, minHeight: 130, maxHeight: 150)
                
                Text("When would you like to leave your house?")
                    .foregroundColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))
                    .font(.system(size: 20))
                    .lineLimit(3)
                    .padding(.all)
                    .fixedSize(horizontal: false, vertical: true)
                
                DatePicker(
                    "",
                    selection: $date1,
                    in: dateRange,
                    displayedComponents: [.hourAndMinute]
                ).datePickerStyle(WheelDatePickerStyle())
                    .padding([.bottom, .trailing])
                    .font(.system(size: 13))
                    .foregroundColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))
                    .frame(minWidth: 60, maxWidth: .infinity, minHeight: 130, maxHeight: 150)
                
                Spacer()
                
                NavigationLink(destination: chooseActivitySetVC(setsa: $setsa)) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 60)
                            .foregroundColor(Color(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9490196078431372))
                        
                        Text("Continue").foregroundColor(.blue)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 60)
                        
                        /*
                         Button {
                         
                         } label: {
                         Text("Continue")
                         .foregroundColor(.blue)
                         .font(.system(size: 18))
                         .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 60)
                         }
                         
                         */
                    }
                    .padding(.horizontal)
                }
                /*
                 ZStack{
                 RoundedRectangle(cornerRadius: 15)
                 .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 60)
                 .foregroundColor(Color(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9490196078431372))
                 Button {
                 
                 } label: {
                 Text("Cancel")
                 .foregroundColor(.red)
                 .font(.system(size: 18))
                 .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 60)
                 }
                 }
                 .padding(.horizontal)
                 */
                
                // Spacer()
            }
            .navigationBarTitle(Text("Hello,"))
            
        
        
        
    }
    
    struct startTimeVC_Previews: PreviewProvider {
        static var previews: some View {
            startTimeVC(setsa: .constant([]))
        }
    }
}
