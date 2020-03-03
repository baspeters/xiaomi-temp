//
//  ContentView.swift
//  bletherm
//
//  Created by Bas Peters on 02/03/2020.
//  Copyright © 2020 Bas Peters. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var closeButtonHover = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .trailing) {
                Group {
                    Spacer().frame(height: 14)
                    TemperatureView()
                    HumidityView()
                }
                .foregroundColor(Color(red: 58/255, green: 63/255, blue: 67/255))
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
            }
            .frame(maxWidth: 350, maxHeight: 350)
            .overlay(
                RoundedRectangle(cornerRadius: 65)
                    .stroke(Color(red: 179/255, green: 186/255, blue: 194/255), lineWidth: 110)
                    .shadow(radius: 5)
                    .shadow(color: Color.black.opacity(0.6), radius: 5, x: 0, y: 0)
            )
            .background(Color(red: 218/255, green: 223/255, blue: 227/255))
         
            //CloseButtonView()
            Button("Close"){}.buttonStyle(CloseButtonStyle())
            
        }
    }
}

struct CloseButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        CloseButtonView(configuration: configuration)
    }
}
    
struct CloseButtonView : View {
    @State private var hover = false
    
    let configuration: CloseButtonStyle.Configuration
    
    var body: some View {
        
        Button(action: {
            NSApp.hide(nil)
        }){
            Circle()
                .stroke(Color(red: 196/255, green: 86/255, blue: 67/255), lineWidth: 1.4)
                .overlay(
                    Circle().fill(Color(red: 224/255, green: 109/255, blue: 91/255))
            )
                .overlay(
                    Text(hover ? "×" : "")
                        .font(.system(size:14))
                        .offset(y: -1)
                        .foregroundColor(Color(red: 109/255, green: 25/255, blue: 6/255))
                        .padding(0)
            )
                .padding(0)
                .frame(width: 12, height: 12)
                .onHover { _ in self.hover.toggle()}
            
        }
        .buttonStyle(PlainButtonStyle())
        .offset(x: 32, y: 32)
    }
}

struct TemperatureView : View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text("25")
                .font(.custom("LCD", size: 120))
                .padding(0)
                            
            Text(".")
                .font(.system(size: 50))
                .padding(.bottom, 11)
            
            VStack(alignment: .trailing, spacing: 2) {
                HStack(spacing: 0) {
                    Text("º")
                        .font(.system(size: 28))
                        .padding(.top, -4)
                    
                    Text("C")
                        .font(.custom("LCD", size: 30))
                        .padding(.trailing, 1)
                }
                .padding(.trailing, 5)
                
                Text("8")
                    .font(.custom("LCD", size: 70))
                    .padding(0)
                    .padding(.bottom, -1)
            }
            .padding(.bottom, 10)
        }
    }
}

struct HumidityView : View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text("36")
                .font(.custom("LCD", size: 120))
                .padding(.trailing, -10)
            
            Text("%")
                .font(.custom("LCD", size: 60))
                .padding()
                .padding(.leading, 8)
                .padding(.trailing, -12)
                .padding(.bottom, -4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
