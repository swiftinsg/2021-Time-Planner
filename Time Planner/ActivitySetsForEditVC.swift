//
//  ActivitySetsForEditVC.swift
//  Time Planner
//
//  Created by sanjithsethu on 21/11/21.
//

import SwiftUI


struct ActivitySetsForEditVC: View {
    init(setsa: Binding<[activitySets]>) {
        self._setsa = setsa
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color(red: 0.4627450980392157, green: 0.4235294117647059, blue: 0.8196078431372549))]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))]
        UITableView.appearance().backgroundColor = .clear
    }
    @State var isSheetEnabled4 = false
    @Binding var setsa: [activitySets]
    
    var body: some View {
        VStack(alignment:.leading){
            /*
             Text("Today,")
             .fontWeight(.heavy)
             .foregroundColor(Color(red: 0.4627450980392157, green: 0.4235294117647059, blue: 0.8196078431372549))
             .multilineTextAlignment(.leading)
             .font(.system(size: 50))
             .padding([.top, .leading, .trailing])
             */
            List{
                ForEach(setsa) { setsa in
                    
                    NavigationLink(destination: ActiviesInSetVC(activty: setsa)) {
                        VStack(alignment:.leading){
                            Text(setsa.name)
                                .font(.system(size: 20))
                                .foregroundColor(Color(red: 0.4235294117647059, green: 0.11764705882352941, blue: 0.5254901960784314))
                                .fontWeight(.semibold)
                                .padding(.vertical)
                        }
                    }
                    .listRowBackground(Color(hue: 0.742, saturation: 0.049, brightness: 0.984))
                    .sheet(isPresented: $isSheetEnabled4){
                        newActivitySetVC(ActiviteSet: $setsa)
                    }
                }.onDelete { offsets in
                    setsa.remove(atOffsets: offsets)
                }.onMove { source, destination in
                    setsa.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle("Activities")
                .navigationBarItems(trailing: Button(action: {
                    isSheetEnabled4 = true
                }, label: {
                    Image(systemName: "plus")
                }))
                .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ActivitySetsForEditVC_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySetsForEditVC(setsa: .constant([]))
    }
}
