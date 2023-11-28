//
//  today.swift
//  Daili
//
//  Created by Tahiru Agbanwa on 28/11/2023.
//

import Foundation

final class Today{
    var timeStamp:Date
    var title:String
    var message:String
    
    init(timeStamp:Date, title:String, message:String){
        //accesing values from the defined above variables and setting them to initializer value which would be got from json when data ia persisted
        self.timeStamp = timeStamp
        self.title = title
        self.message = message
        
    }
}
