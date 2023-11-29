//
//  SwiftUIView.swift
//  Daili
//
//  Created by Tahiru Agbanwa on 28/11/2023.
//

import SwiftUI

struct DetailsView: View {
    var title:String
    var description:String
    var body: some View {
        VStack(content: {
            Text(title).font(.largeTitle)
            Text(description).font(.subheadline)
            
        })
    }
}

