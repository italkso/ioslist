//
//  Timer15.swift
//  iOSDemo
//
//  Created by 丁海能 on 2020/6/8.
//  Copyright © 2020 Aaron Dean. All rights reserved.
//
/*
实时预览只有秒在动,分未动.使用模拟器可以正常倒计时.
*/

import SwiftUI

struct Timer15: View {
    
    @State private var minutesRemain = 0
    @State private var secondsRemain = 0
    @State private var isActive = true
    
    let minutesTimer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    let secondsTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Image("backgroundImage")
                .resizable()
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                    Text("一刻")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                    ZStack(alignment: .center){
                            Circle()
                                .fill(Color.white.opacity(0.4))
                                .frame(width:UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 2.5)
            
                            VStack{
                                Text("剩余 \(minutesRemain) 分 : \(secondsRemain) 秒").font(.title).foregroundColor(.primary)
                            }
                        }
                    HStack(spacing: UIScreen.main.bounds.width / 5 - 20){
                            //Mark: - 开始
                            Button(action: {
                                self.minutesRemain = 14
                                self.secondsRemain = 59
                            }){
                                VStack{
                                    Image(systemName: "play.circle").resizable()
                                    .frame(width: 40, height: 40)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.white)
                                    Text("开始").font(.headline).foregroundColor(.white)
                                }
                            }
                            //Mark: - 重置
                            Button(action: {
                                self.minutesRemain = 0
                                self.secondsRemain = 0
                            }){
                                VStack{
                                    Image(systemName: "multiply.circle").resizable()
                                    .frame(width: 40, height: 40)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.white)
                                    Text("置零").font(.headline).foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .onReceive(minutesTimer) { _ in
                        guard self.isActive else { return }
                        if self.minutesRemain > 0 && self.secondsRemain == 0{
                             self.minutesRemain -= 1
                        }
                    }
                    .onReceive(secondsTimer) { _ in
                        guard self.isActive else { return }
                        if self.minutesRemain > 0 && self.secondsRemain == 0{
                             self.secondsRemain = 59
                        }

                        if self.secondsRemain > 0{
                            self.secondsRemain -= 1
                        }
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                        self.isActive = false
                    }        }
        }
}

struct Timer15_Previews: PreviewProvider {
    static var previews: some View {
        Timer15()
    }
}
