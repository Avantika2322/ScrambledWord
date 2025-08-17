//
//  ContentView.swift
//  ScrambledWord
//
//  Created by Binary Semantics on 14/08/25.
//

// hashable, equatable, extension, protocols, identity, identifiable, opaque type, 

import SwiftUI

struct ContentView: View {
    var letters : [String] = ["O", "R", "A", "N", "G", "E"]
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Spacer()
                        Image("apple")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Spacer()
                        HStack{
                            ForEach(letters, id: \.self){ch in
                                VStack {
                                    LetterView(letter: ch)
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 30, height: 2)
                                }
                                .padding(.bottom, 30)
                            }
                        }
                        
                    }
                    .frame(width: proxy.size.width * 0.9, height: proxy.size.width * 0.9)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.border, lineWidth: 3)
                    })
                    
                    Text("Score: 0")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.white)
                        .padding(.top)
                    
                    HStack{
                        ForEach(letters, id: \.self){ch in
                            LetterView(letter: ch)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct LetterView: View {
    let letter : String
    var body: some View {
        Text(letter)
            .font(.system(size: 18, weight: .semibold))
            .foregroundStyle(Color.white)
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
