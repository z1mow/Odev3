//
//  YapilacakDetayViewModel.swift
//  Odev3
//
//  Created by Şakir Yılmaz ÖĞÜT on 24.04.2025.
//

import Foundation

class YapilacakDetayViewModel {
    var yapilacaklarRepository = YapilacaklarRepository()
    
    func guncelle(id:Int, name:String) {
        yapilacaklarRepository.guncelle(id: id, name: name)
    }
    
}
