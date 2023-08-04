//
//  ResultScreenViewController.swift
//  GuessNumber
//
//  Created by Mehmet Serhat Gültekin on 4.08.2023.
//

import UIKit

class ResultScreenViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result : Bool? // tahmin ekranından sonuç ekranına veri aktarımı yapabilmek için oluşturulan değişken
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Sonuç Ekranı"
        
        if result == true {
            
            iconImageView.image = UIImage(named: "happy.image")
            resultLabel.text = "Kazandınız"
            
        }else {
            
            iconImageView.image = UIImage(named: "sad.image")
            resultLabel.text = "Kaybettiniz"
            
        }
        
    }
    
    @IBAction func replayButton(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true) // yeniden başlatmak için
        
    }
    
   

}
