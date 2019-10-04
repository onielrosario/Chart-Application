//
//  ContentView.swift
//  ChartApp
//
//  Created by Oniel Rosario on 10/3/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var pickerSelectedItem = 0
    @State var dataPoints: [[CGFloat]] = [
    [50,100,150,200,125,65,15],
    [35,140,120,22,200,110,85],
    [200,67,32,113,180,65,150]
    ]
    
    
    var body: some View {
        ZStack {
            Color("AppBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calory Intake")
                .foregroundColor(Color("TitleColor"))
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                
                HStack(spacing: 20) {
                    BarView(value: dataPoints[pickerSelectedItem][0], day: "Su")
                    BarView(value: dataPoints[pickerSelectedItem][1], day: "M")
                    BarView(value: dataPoints[pickerSelectedItem][2], day: "T")
                    BarView(value: dataPoints[pickerSelectedItem][3], day: "W")
                    BarView(value: dataPoints[pickerSelectedItem][4], day: "Th")
                    BarView(value: dataPoints[pickerSelectedItem][5], day: "F")
                    BarView(value: dataPoints[pickerSelectedItem][6], day: "Sa")
                }.padding(.top, 24)
                    .animation(.default)
            }
        }
    }
}

struct BarView: View {
    var value: CGFloat
    var day: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color("barColorBackground"))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color("barColor"))
            }
            Text(day).padding(.top, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environment(\.colorScheme, .dark)
    }
}
