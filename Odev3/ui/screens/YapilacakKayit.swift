//
//  YapilacakKayit.swift
//  Odev3
//
//  Created by Şakir Yılmaz ÖĞÜT on 24.04.2025.
//

import UIKit

class YapilacakKayit: UIViewController {
    
    @IBOutlet weak var tfYapilacakName: UITextField!
    var yapilacakKayitViewModel = YapilacakKayitViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonKaydet(_ sender: UIButton) {
        if let name = tfYapilacakName.text {
            yapilacakKayitViewModel.kaydet(name: name)
        }
    }
    

}
