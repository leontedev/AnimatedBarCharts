//
//  ArcView.swift
//  AnimatedBarCharts
//
//  Created by Mihai Leonte on 06/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct InsetArc: InsettableShape {
    var startAngle: Double
    var endAngle: Double
    
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    // To make the Path/Shape animate
    var animatableData: Double {
        get { return endAngle }
        set { endAngle = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = Angle(degrees: startAngle) - rotationAdjustment
        let modifiedEnd = Angle(degrees: endAngle) - rotationAdjustment

        var path = Path()

        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ArcView: View {
    @State private var networth: Double = 0 {
        didSet {
            let x = networth * 180 / 250
            endAngle = Double(abs(90 - x))
        }
    }
    @State private var target: Int = 250
    
    @State private var startAngle: Double = -90
    @State private var endAngle: Double = -89
    
    var body: some View {
        VStack {
            ZStack {
                InsetArc(startAngle: -90, endAngle: 90, clockwise: true)
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .frame(width: 300)
                
                InsetArc(startAngle: startAngle, endAngle: endAngle, clockwise: true)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .frame(width: 300)
                
                VStack {
                    HStack {
                        Text("\(Int(networth))k")
                            .foregroundColor(.blue)
                            .fontWeight(.heavy)
                            .font(.system(size:40))
                        Spacer()
                        .frame(width:50)
                    }
                    
                    HStack {
                        Spacer()
                            .frame(width:50)
                        Text(" / \(target)k")
                            .foregroundColor(.gray)
                            .fontWeight(.heavy)
                            .font(.system(size:40))
                    }
                    
                    Spacer()
                        .frame(height: 60)
                }
                
            }
            
            Slider(value: $networth, in: 0...250, step: 1)
            
            Button(action: {
                withAnimation {
                    self.networth = 160
                }
            }) {
                Text("160k")
            }
            
            Button(action: {
                self.networth = 0
            }) {
                Text("Reset")
            }

            
        }
    }
}

struct ArcView_Previews: PreviewProvider {
    static var previews: some View {
        ArcView()
    }
}
