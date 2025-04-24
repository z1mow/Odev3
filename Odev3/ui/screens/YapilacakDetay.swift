//
//  YapilacakDetay.swift
//  Odev3
//
//  Created by Şakir Yılmaz ÖĞÜT on 24.04.2025.
//

import UIKit

class YapilacakDetay: UIViewController {
    @IBOutlet weak var tfYapilacakName: UITextField!
    var yapilacakDetayViewModel = YapilacakDetayViewModel()
    
    var yapilacak: Yapilacaklar?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let tempYapilacak = yapilacak {
            tfYapilacakName.text = tempYapilacak.name
        }
    }
    
    
    @IBAction func buttonGuncelle(_ sender: UIButton) {
        if let name = tfYapilacakName.text, let tempYapilacak = yapilacak {
            yapilacakDetayViewModel.guncelle(id: tempYapilacak.id!, name: tempYapilacak.name!)
        }
        //Bir önceki sayfaya döner
        //navigationController?.popViewController(animated: true)
        //En baştaki sayfaya döner
        //navigationController?.popToRootViewController(animated: true)
    }
}
