//
//  ContentView.swift
//  AnimatedBarCharts
//
//  Created by Mihai Leonte on 10/9/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 30, 60, 10, 50],
        [150, 200, 50, 90, 150, 60, 120],
        [75, 175, 105, 60, 25, 170, 200]
        ]
    
    var body: some View {
        
        ZStack {
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                VStack {
                    Text("Networth")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                    
                    ArcView()
                    
//                    HStack {
//                        ZStack(alignment: .leading) {
//                            Capsule().frame(width: 330, height: 30)
//                                .foregroundColor(Color("emptyCapsule"))
//                            ZStack(alignment: .trailing) {
//                                Capsule().frame(width: 120, height: 30)
//                                    .foregroundColor(Color("filledCapsule"))
//                                Text("32%")
//                                    .font(.system(size: 13))
//                                    .fontWeight(.bold)
//                                    .padding(.trailing, 10)
//                            }
//                            
//                        }
//                    }
//                    Text("362k / 1 mil.")
//                        .font(.system(size: 17))
//                        .fontWeight(.medium)
                }.padding(.bottom, 50)
                
                
//                Text("Portfolio")
//                    .font(.system(size: 34))
//                    .fontWeight(.heavy)
//                
//                Picker(selection: $pickerSelectedItem, label: Text("")) {
//                    Text("Stocks").tag(0)
//                    Text("Bonds").tag(1)
//                    Text("Gold").tag(2)
//                }.pickerStyle(SegmentedPickerStyle())
//                    .padding(.horizontal, 24)
//                
//
//                
//                HStack (spacing: 16) {
//                    BarView(value: dataPoints[pickerSelectedItem][0], day: "Mo")
//                    BarView(value: dataPoints[pickerSelectedItem][1], day: "Tu")
//                    BarView(value: dataPoints[pickerSelectedItem][2], day: "We")
//                    BarView(value: dataPoints[pickerSelectedItem][3], day: "Th")
//                    BarView(value: dataPoints[pickerSelectedItem][4], day: "Fr")
//                    BarView(value: dataPoints[pickerSelectedItem][5], day: "Sa")
//                    BarView(value: dataPoints[pickerSelectedItem][6], day: "Su")
//                }.padding(.top, 24)
//                    .animation(.default)
            
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
                    .foregroundColor(Color("emptyCapsule"))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color("filledCapsule"))
            }
            Text(day).padding(.top, 8)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
