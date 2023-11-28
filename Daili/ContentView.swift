//
//  ContentView.swift
//  Daili
//
//  Created by Tahiru Agbanwa on 28/11/2023.
//

import SwiftUI

struct HomeView:View {
    
    let items:[Today] = [
       
    ]
    
    var body: some View{
        NavigationView(content: {
            List(0..<items.count){
                item in
                //show empty or content
                    if(items.isEmpty){
                        Text("Empty Journal").font(.largeTitle).foregroundStyle(.gray)
                        return 
                    }else{
                        NavigationLink(destination:  DetailsView()){
                            Text("S0mething")
                        }
                }
            }.navigationTitle(Text("Daili"))

            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    EditButton()
                }
                    ToolbarItem(placement: .topBarTrailing){
                        Button(action:{}){
                            Label("Add Journal",systemImage: "plus")
                        }
                }
            }
        }
        )
    }
}


#Preview {
    HomeView()
}
