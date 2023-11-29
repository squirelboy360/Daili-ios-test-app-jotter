//
//  ContentView.swift
//  Daili
//
//  Created by Tahiru Agbanwa on 28/11/2023.
//

import SwiftUI

struct HomeView:View {
    @State var showAdder:Bool = false
    @State var titleInput:String = ""
    @State var descriptionInput:String = ""
    @State var items:[Today] = [
        Today(timeStamp: Date.now, title: "First Journal", message: "Roses are red, Skies are blue, Amongst all i don't like you")
    ]
    
    var body: some View{
        NavigationSplitView{
            //show empty or content
            if(items.isEmpty){
                Text("Empty Journal").font(.largeTitle).foregroundStyle(.gray).navigationTitle(Text("Daili"))
                
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing){
                            Button(action:{showAdder = true}){
                                Label("Add Journal",systemImage: "plus")
                            }
                        }
                    }
            }else{
                //Rendered content
                List {
                    ForEach (items.indices,id:\.self) {
                        item in NavigationLink(destination:  DetailsView(title: items[item].title, description: items[item].message)){
                            VStack{
                                Text("\(items[item].title)").font(.headline)
                                Text("\(items[item].timeStamp, format: Date.FormatStyle(date: .none, time: .standard))").font(.caption)
                            }.padding()
                        }
                    }
                    .onDelete(perform: deleteItem)
                        
                    }.navigationTitle(Text("Daili"))
                    
                        .toolbar{
                            ToolbarItem(placement: .topBarTrailing){
                                EditButton()
                            }
                            ToolbarItem(placement: .topBarTrailing){
                                Button(action:{showAdder = true}){
                                    Label("Add Journal",systemImage: "plus")
                                }
                            }
                            
                        }
                        .sheet( isPresented: $showAdder){
                            VStack(content: {
                                Form(content: {
                                    TextField("Title", text: $titleInput)
                                    TextField("Title", text: $descriptionInput)
                                    Button("Add"){
                                        showAdder = false
                                        items.append(Today(timeStamp: Date.now, title: titleInput, message: descriptionInput))
                                    }
                                })
                            })

                        }
            }
                
        } detail: {Text("Select an item")
        }
        
}
    
    // Delete function
       private func deleteItem(at offsets: IndexSet) {
           items.remove(atOffsets: offsets)
       }
                       }

#Preview {
    HomeView()
}
