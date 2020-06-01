//
//  TextImageStackView.swift
//  iOSDemo
//
//  Created by 丁海能 on 2020/6/1.
//  Copyright © 2020 Aaron Dean. All rights reserved.
//

import SwiftUI

struct TextImageStackView: View {
    
    @State private var isShowInfo = false
    
    var body: some View {
//ZStack--堆叠,多用于设置背景
            ZStack(alignment:.bottom){
                Image("fractal-1280102_1920")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
                .blur(radius: 5)
//VStack--垂直布局
                VStack(spacing: 20){
                    //HStack--将系统图标与文本进行水平布局
                    HStack(spacing: 15){
                        Image(systemName: "square.stack.3d.up.fill").foregroundColor(.blue)
                        
                      Text("SwiftUI : 使用 ZStack 对视图进行堆叠")
                        .foregroundColor(.blue)
                        .font(.headline)
                    }
                    
                    //对主要内容进行垂直布局
                    VStack(spacing: 35){
                        Image("Libai_touxiang")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .orange, radius: 1)
                        
                        HStack(alignment:.top){
                            Text("静夜思")
                                .font(.largeTitle)
                        }
//sheet 弹出框:弹出作者简介
                        Button(action: {
                            self.isShowInfo = true
                        }){
                            Text("[唐] 李 白(点击查看)").foregroundColor(.white)
                        }
                        .sheet(isPresented: $isShowInfo) {
                            InfoAboutLiBai()
                        }
                        
                        Text("""
                            床 前 明 月 光
                            疑 是 地 上 霜
                            举 头 望 明 月
                            低 头 思 故 乡
                         """
                        )//三引号原样输出多行文字
                            .font(.system(size: 25))
                         .foregroundColor(.white)
                        
                        Text("[注]《静夜思》是中国唐代诗人李白所作的流传最广泛的一首诗，体裁属五言乐府诗。诗句在不同朝代的诗集略有不同，现今流传最广的版本乃清代文人蘅塘退士（本名孙洙）所编纂的《唐诗三百首》所收录，但被质疑内容并不忠于原诗。早期及历代各《李太白全集》版本皆作：“床前看月光，疑是地上霜。举头望山月，低头思故乡。”--维基百科")
                    }
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(0.7)
                    .padding(10)
                    
                Spacer(minLength: 10)
                    Text("- iOS Develop -").foregroundColor(.white)
            }
        }
    }
}

struct TextImageStacks_Previews: PreviewProvider {
    static var previews: some View {
        TextImageStackView()
    }
}

