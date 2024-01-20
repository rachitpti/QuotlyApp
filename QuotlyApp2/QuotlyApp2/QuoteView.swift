//
//  QuoteView.swift
//  QuotlyApp2
//
//  Created by Rachit Prajapati on 1/20/24.
//

import SwiftUI

struct QuoteView: View {
    
    @Binding var name: String
    @State private var quotes: [Quote] = [Quote]()
    
    var body: some View {
        ZStack {
            if quotes.isEmpty {
                Text("Hello \(name), I've prepapared some hood quotes for you today, cheers.")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .padding()
            }
            
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    ForEach(quotes, id: \.q) { quote in
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(quote.q)
                                    .fontWeight(.heavy)
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                
                                Text(quote.a)
                                    .fontWeight(.medium)
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }.padding()
                        }
                   
                        
                    }
                }
            }.ignoresSafeArea()
                .scrollTargetBehavior(.paging)
        }.task {
            await getQuotes()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func getQuotes() async {
        
        do {
            quotes = try await QuoteFetchResource.getQuote()
        } catch let error {
            print(error.localizedDescription)
        }
       
    }
}

#Preview {
    QuoteView(name: .constant("Jack"))
}
