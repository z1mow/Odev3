//
//  YapilacakKayitViewModel.swift
//  Odev3
//
//  Created by Şakir Yılmaz ÖĞÜT on 24.04.2025.
//

import Foundation

class YapilacakKayitViewModel {
    var yapilacaklarRepository = YapilacaklarRepository()
    
    func kaydet(name:String) {
        yapilacaklarRepository.kaydet(name: name)
    }
}
