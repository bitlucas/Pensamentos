//
//  PensamentoManager.swift
//  Pensamentos
//
//  Created by Lucas Bitar on 03/09/18.
//  Copyright © 2018 Lucas Bitar. All rights reserved.
//

import Foundation

class PensamentoManager {
    
    let quotes: [Quote]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
    }
    
    func getRandomQuote() -> Quote {
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }
}
