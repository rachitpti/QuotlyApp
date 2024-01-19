//
//  ContentView.swift
//  QuotlyApp
//
//  Created by Rachit Prajapati on 1/19/24.
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
                    .preferredColorScheme(.light)
                
                VStack(alignment: .center, spacing: 15) {
                    Text("Welcome to \(Text("Quotly").foregroundColor(.red))!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Let's strive towards cultivating a positive mindset, overcome challenges and stay focused on our aspirations.")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width)
           
                    Spacer()
                    Text("Lets start by writing your name below.")
                    TextField("Write here", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .padding()
                    
                    if !name.isEmpty {
                        NavigationLink(destination: {
                            QuoteView(name: $name).toolbar(.hidden)
                        }, label: {
                            Text("Continue")
                                .foregroundStyle(.white)
                                .padding()
                                .background(Capsule().fill(Color.black))
                                .shadow(radius: 10)
                            
                        })
                    }
                
                }
            }
        }
     
    }
}

#Preview {
    ContentView()
}

