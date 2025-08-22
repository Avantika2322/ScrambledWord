//
//  ContentView.swift
//  ScrambledWord
//
//  Created by Binary Semantics on 14/08/25.
//

// hashable, equatable, extension, protocols, identity, identifiable, opaque type, 

import SwiftUI

struct ContentView: View {
    @State var letters : [LetterModel] = [
        LetterModel(id: 0, letterText: "A"),
        LetterModel(id: 1, letterText: "R"),
        LetterModel(id: 2, letterText: "O"),
        LetterModel(id: 3, letterText: "N"),
        LetterModel(id: 4, letterText: "E"),
        LetterModel(id: 5, letterText: "G"),
    ]
    @State var guessLetters : [LetterModel] = []
    
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
                            ForEach(Array(guessLetters.enumerated()), id: \.1){index, ch in
                                VStack {
                                    LetterView(letter: ch)
                                        .onTapGesture {
                                            guessLetters.remove(at: index)
                                            letters[ch.id].letterText = ch.letterText
                                        }
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
                        ForEach(Array(letters.enumerated()), id: \.1){index, ch in
                            LetterView(letter: ch)
                                .onTapGesture {
                                    if ch.letterText.isEmpty {return}
                                    guessLetters.append(ch)
                                    letters[index].letterText = ""
                                }
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
    let letter : LetterModel
    var body: some View {
        Text(letter.letterText)
            .font(.system(size: 18, weight: .semibold))
            .foregroundStyle(Color.white)
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
