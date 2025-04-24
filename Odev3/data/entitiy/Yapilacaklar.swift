//
//  Yapilacaklar.swift
//  Odev3
//
//  Created by Şakir Yılmaz ÖĞÜT on 24.04.2025.
//

import Foundation

class Yapilacaklar: Codable {
    var id: Int?
    var name: String?
    
    //Constructor
    //Sınıftan nesne oluşturulduğunda çalışan metodlardır.
    
    init() {
        
    }
    
    init(id: Int, name: String) {
        self.id = id //Shadowing
        self.name = name
    }
    
}
