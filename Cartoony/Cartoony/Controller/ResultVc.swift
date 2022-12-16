//
//  ResultVc.swift
//  Cartoony
//
//  Created by Abduraxmon on 05/12/22.
//

import UIKit

class ResultVc: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var resultImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    @IBAction func tryAgainPressed(_ sender: UIButton) {
        dismiss(animated: true)
       
    }
    
}
