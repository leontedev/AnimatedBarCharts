//
//  QuarterArcView.swift
//  AnimatedBarCharts
//
//  Created by Mihai Leonte on 06/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct QuarterArcView: View {
    @State private var networth: Int = 0
    @State private var target: Int = 250
    
    var body: some View {
        ZStack {
//            InsetArc(startAngle: .degrees(-90), endAngle: .degrees(0), clockwise: true)
//            //.strokeBorder(Color.blue, lineWidth: 40)
//                .stroke(Color.gray, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
//                .frame(width: 300)
//            
//            InsetArc(startAngle: .degrees(-90), endAngle: .degrees(-40), clockwise: true)
//            //.strokeBorder(Color.blue, lineWidth: 40)
//                .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
//                .frame(width: 300)
            
            VStack {
                HStack {
                    Text("\(networth)k")
                        .foregroundColor(.blue)
                        .fontWeight(.heavy)
                        .font(.system(size:30))
                    Spacer()
                    .frame(width:90)
                }
                
                HStack {
                    Spacer()
                        .frame(width:10)
                    Text(" / \(target)k")
                        .foregroundColor(.gray)
                        .fontWeight(.heavy)
                        .font(.system(size:30))
                }
                
                Spacer()
                    .frame(height: 60)
            }
            
        }
    }
}

struct QuarterArcView_Previews: PreviewProvider {
    static var previews: some View {
        QuarterArcView()
    }
}
