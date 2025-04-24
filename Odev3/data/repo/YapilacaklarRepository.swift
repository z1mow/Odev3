//
//  YapilacaklarRepository.swift
//  Odev3
//
//  Created by Şakir Yılmaz ÖĞÜT on 24.04.2025.
//

import Foundation
import RxSwift

class YapilacaklarRepository {
    var yapilacaklarListesi = BehaviorSubject<[Yapilacaklar]>(value: [Yapilacaklar]())
    
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniYolu = URL(fileURLWithPath: hedefYol).appendingPathComponent("todo_app.sqlite")
        db = FMDatabase(path: veritabaniYolu.path)
    }
    
    func kaydet(name: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO toDos (name) VALUES (?,?)", values: [name])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func guncelle(id: Int, name: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE toDos SET name=? WHERE id=?", values: [name,id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func ara(aramaKelimesi: String) {
        db?.open()
        
        do {
            var liste = [Yapilacaklar]()
            
            let result = try db!.executeQuery("SELECT * FROM toDos WHERE name LIKE '%\(aramaKelimesi)%'", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
                
                let yapilacak = Yapilacaklar(id: id, name: name)
                
                liste.append(yapilacak)
            }
            
            yapilacaklarListesi.onNext(liste)//Tetikleme
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func sil(id: Int) {
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM toDos WHERE id=?", values: [id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func yapilacaklariYukle() {
        db?.open()
        
        do {
            var liste = [Yapilacaklar]()
            
            let result = try db!.executeQuery("SELECT * FROM toDos", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
                
                let yapilacak = Yapilacaklar(id: id, name: name)
                
                liste.append(yapilacak)
            }
            
            yapilacaklarListesi.onNext(liste)//Tetikleme
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
}
