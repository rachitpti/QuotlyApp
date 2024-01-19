//
//  QuoteView.swift
//  Quotly
//
//  Created by Rachit Prajapati on 1/19/24.
//

import SwiftUI
import SwiftData

struct QuoteView: View {
    

    @Binding var name: String
    @State var quotes: [Quotes] = [Quotes]()
    var body: some View {
        ZStack {
            
            if quotes.isEmpty {
                Text("Hello, \(name). I've prepared some quotes for you today, cheers.")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                    .multilineTextAlignment(.leading)
            }
         
            
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    ForEach(quotes, id :\.q) { quote in
                        ZStack {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(quote.q)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    
                                
                                Text(quote.a)
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .foregroundStyle(.white)
                                
                            }.padding()
                            .preferredColorScheme(.light)
                            
                        }
                            
                    }
                }
            }.scrollTargetBehavior(.paging)
                .ignoresSafeArea()
        
        }.task {
                await callQuote()

        }
        
  
    }
     
    func callQuote() async {
        do {
            quotes = try await NetworkResource.getQuotes()
            print(quotes)
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

#Preview {
    QuoteView(name: .constant("Hello"))
}
