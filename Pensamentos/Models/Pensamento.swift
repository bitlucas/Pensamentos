//
//  Pensamento.swift
//  Pensamentos
//
//  Created by Lucas Bitar on 03/09/18.
//  Copyright © 2018 Lucas Bitar. All rights reserved.
//

import Foundation

struct Quote: Codable { // Encodable, Decodable
    
    let quote: String
    let author: String
    let image: String
    
    var formattedQuote: String {
        return "〝" + quote + "〞"
    }
    
    var formattedAuthor: String {
        return "- " + author //+ " -"
    }

    
}
