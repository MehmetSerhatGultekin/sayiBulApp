//
//  GuessScreenViewController.swift
//  GuessNumber
//
//  Created by Mehmet Serhat Gültekin on 4.08.2023.
//

import UIKit

class GuessScreenViewController: UIViewController {
    
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    var randomNumber : Int?
    var remainingRight = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        randomNumber = Int(arc4random_uniform(100))
        print(randomNumber!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let incomingData = sender as? Bool {
            
            let destinationVC = segue.destination as! ResultScreenViewController
            destinationVC.result = incomingData
            
        }
    }
    @IBAction func guessButton(_ sender: Any) {
        
        infoLabel.isHidden = false
        remainingRight -= 1
        
        if let data = guessTextField.text {
            
            if let guess = Int(data) {
                
                if remainingRight != 0 {
                    
                    if guess == randomNumber! {
                        // dogru bildin
                        // sayfa geçişi
                        let result = true
                        performSegue(withIdentifier: "toResultVC", sender: result)
                        
                    }
                    
                    if guess > randomNumber! {
                        // azalt
                        infoLabel.text = "Azalt"
                        remainingLabel.text = "Kalan Hak : \(remainingRight)"
                        
                    }
                    
                    if guess < randomNumber! {
                        // arttır
                        infoLabel.text = "Arttır"
                        remainingLabel.text = "Kalan Hak : \(remainingRight)"
                        
                    }
                    
                }else {
                   
                    let result = false
                    performSegue(withIdentifier: "toResultVC", sender: result)
                    
                }
                
                guessTextField.text = ""
            }
        }
    }
    
   
}
