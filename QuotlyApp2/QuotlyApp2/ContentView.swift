//
//  ContentView.swift
//  QuotlyApp2
//
//  Created by Rachit Prajapati on 1/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Image1")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.3)
                VStack {
                    Text("Welcome to \(Text("Quotly").foregroundStyle(.red))!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Text("Let's strive towards cultivating a positive mindset, overcome challenges and stay focused on our aspirations.")
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("Let's start by writing your name below.")
                    TextField(text: $name) {
                        Text("Write here")
                    }.textFieldStyle(.roundedBorder).frame(width: UIScreen.main.bounds.width - 20)
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                    
                    if !name.isEmpty {
                        NavigationLink(destination: QuoteView(name: $name).toolbar(.hidden)) {
                            Text("Continue")
                                .foregroundStyle(.white)
                                .padding()
                                .background(Capsule().fill(.black))
                                .shadow(radius: 10)
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
