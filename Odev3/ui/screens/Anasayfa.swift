//
//  Anasayfa.swift
//  Odev3
//
//  Created by Şakir Yılmaz ÖĞÜT on 24.04.2025.
//

import UIKit

class Anasayfa: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yapilacaklarTableView: UITableView!
    var yapilacaklarListesi = [Yapilacaklar]()
    var anasayfaViewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        yapilacaklarTableView.delegate = self
        yapilacaklarTableView.dataSource = self
        
        _ = anasayfaViewModel.yapilacaklarListesi.subscribe(onNext: { liste in
            self.yapilacaklarListesi = liste
            self.yapilacaklarTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaViewModel.yapilacaklariYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let yapilacak = sender as? Yapilacaklar {
                let gidilecekVC = segue.destination as! YapilacakDetay
                gidilecekVC.yapilacak = yapilacak
            }
        }
    }


}

extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaViewModel.ara(aramaKelimesi: searchText)
    }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yapilacakHucre") as! YapilacakHucre
        let yapilacak = yapilacaklarListesi[indexPath.row]
        hucre.yapilacakName.text = yapilacak.name
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak = yapilacaklarListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yapilacak)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            contextualAction,view,bool in//closure
            
            let yapilacak = self.yapilacaklarListesi[indexPath.row]
    
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacak.name!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet",style: .destructive){ action in
                self.anasayfaViewModel.sil(id: yapilacak.id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
