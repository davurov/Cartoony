//
//  MainVc.swift
//  Cartoony
//
//  Created by Abduraxmon on 05/12/22.
//

import UIKit

class MainVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func startPressed(_ sender: Any) {
        let vc2 = PhotoVc(nibName: "PhotoVc", bundle: nil)
        vc2.modalPresentationStyle = .fullScreen
        present(vc2, animated: true)
    }
    
}
