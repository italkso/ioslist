//
//  FontColorSliderView.swift
//  iOSDemo
//
//  Created by 丁海能 on 2020/6/3.
//  Copyright © 2020 Aaron Dean. All rights reserved.
//

/*
 本 Demo 演示如何通过结合滑块Slider 和 @State 属性的使用改变字体大小和颜色.
 */

import SwiftUI

struct FontColorSliderView: View {
    //rgba(231, 76, 60,1.0)
        @State private var red: Double = 231
        @State private var green: Double = 76
        @State private var blue: Double = 60
        @State private var opacity:Double = 0.9
        
        @State private var size: Double = 20
        
        var body: some View {
            VStack{
                VStack{
                    Text("拖动滑块改变字体颜色和大小")
                        .font(.system(size: CGFloat(size)))
                        .padding()
                        .foregroundColor(Color(red:red/255, green:green/255, blue:blue/255).opacity(opacity))
                }.padding()
                
                VStack{
                    Text("改变字体大小").font(.title)
                               Slider(value: $size, in: 5...50, step:5)
                }
                
                VStack(alignment: .leading, spacing: 20){
                        
                        Text("改变字体颜色和透明度").font(.title)
                        
                        Slider(value: $red, in: 0...255,step: 1.0)
                        Text("红: \(Int(red))")
                    
                        Slider(value: $green, in: 0...255,step: 1.0)
                        Text("绿: \(Int(green))")
                    
                        Slider(value: $blue, in: 0...255,step: 1.0)
                        Text("蓝: \(Int(blue))")
                    
                        Slider(value: $opacity, in: 0...1,step: 0.1)
                        Text("透明度")
                }
                
            }.padding()
        }
}

struct FontColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        FontColorSliderView()
    }
}
