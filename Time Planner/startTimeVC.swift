//
//  startTimeVC.swift
//  Time Planner
//
//  Created by sanjithsethu on 20/11/21.
//

import SwiftUI

struct startTimeVC: View {
    
    init() {
            //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color(red: 0.4627450980392157, green: 0.4235294117647059, blue: 0.8196078431372549))]

            //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))]
        }
    
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
            VStack(alignment:.leading){
//                Text("Hello,")
//                    .fontWeight(.heavy)
//                    .foregroundColor(Color(red: 0.4627450980392157, green: 0.4235294117647059, blue: 0.8196078431372549))
//                    .multilineTextAlignment(.leading)
 //                   .font(.system(size: 50))
 //                   .padding(.all)
                
                
                Text("When would you like to start getting ready?")
                    .foregroundColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))
                    .font(.system(size: 20))
                    .lineLimit(3)
                    .padding(.horizontal)
                    .fixedSize(horizontal: false, vertical: true)
                
           //     Spacer()
                
                DatePicker(
                    "",
                    selection: $date,
                    in: dateRange,
                    displayedComponents: [.date,.hourAndMinute]
                ).datePickerStyle(GraphicalDatePickerStyle())
                    .padding(.all)
                    .font(.system(size: 13))
                    .foregroundColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))
                
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 60)
                        .foregroundColor(Color(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9490196078431372))
                    Button {
                       
                    } label: {
                        Text("Confirm")
                            .foregroundColor(.blue)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 60)
                    }
                    
                    
                }
                .padding(.horizontal)
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
        
    }
    
    struct startTimeVC_Previews: PreviewProvider {
        static var previews: some View {
            startTimeVC()
        }
    }
}
