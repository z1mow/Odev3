//
//  AnasayfaViewModel.swift
//  Odev3
//
//  Created by Şakir Yılmaz ÖĞÜT on 24.04.2025.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var yapilacaklarRepository = YapilacaklarRepository()
    var yapilacaklarListesi = BehaviorSubject<[Yapilacaklar]>(value: [Yapilacaklar]())
    
    init() {
        veritabaniKopyala()
        yapilacaklarListesi = yapilacaklarRepository.yapilacaklarListesi//Bağlantı
    }
    
    func ara(aramaKelimesi: String) {
        yapilacaklarRepository.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(id: Int) {
        yapilacaklarRepository.sil(id: id)
        yapilacaklariYukle()
    }
    
    func yapilacaklariYukle() {
        yapilacaklarRepository.yapilacaklariYukle()
    }
    
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "todo_app", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("todo_app.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{}
        }
    }
    
}
