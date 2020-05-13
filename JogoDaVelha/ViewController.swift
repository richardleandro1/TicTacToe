//
//  ViewController.swift
//  JogoDaVelha
//
//  Created by Richard Leandro on 31/03/20.
//  Copyright © 2020 Richard Leandro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ActivePlayer = 1
    var Player1 = [Int]()
    var Player2 = [Int]()
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonSelectEvent(_ sender: Any) {
        let btnSelect = sender as! UIButton
        play(btnSelect: btnSelect)
    }
    

    
    func play(btnSelect:UIButton){
       
        if ActivePlayer == 1{
            btnSelect.setTitle("X", for: UIControl.State.normal)
            btnSelect.backgroundColor = UIColor(displayP3Red: 215/255, green: 56/255, blue: 94/255, alpha: 0.5)
            btnSelect.setTitleColor(UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), for: UIControl.State.normal)
            
            ActivePlayer = 2
            Player1.append(btnSelect.tag)
            print(Player1)
            AutoPlay()
        }else{
            btnSelect.setTitle("0", for: UIControl.State.normal)
            btnSelect.backgroundColor = UIColor(displayP3Red: 32/255, green: 192/255, blue: 243/255, alpha: 0.5)
            
            ActivePlayer = 1
            Player2.append(btnSelect.tag)
            print(Player2)
        }
        btnSelect.isEnabled = false
        findWinner()
    }
    
    func findWinner(){
        var winner = -1
        
        //Rows
        if(Player1.contains(1) && Player1.contains(2) && Player1.contains(3)){
            winner = 1
        }
        
        if(Player2.contains(1) && Player2.contains(2) && Player2.contains(3)){
            winner = 2
        }
        
        if(Player1.contains(4) && Player1.contains(5) && Player1.contains(6)){
            winner = 1
        }
        
        if(Player2.contains(4) && Player2.contains(5) && Player2.contains(6)){
            winner = 2
        }
        
        if(Player1.contains(7) && Player1.contains(8) && Player1.contains(9)){
            winner = 1
        }
               
        if(Player2.contains(7) && Player2.contains(8) && Player2.contains(9)){
            winner = 2
        }
        
        // Columns
        if(Player1.contains(1) && Player1.contains(4) && Player1.contains(7)){
            winner = 1
        }
        
        if(Player2.contains(1) && Player2.contains(4) && Player2.contains(7)){
            winner = 2
        }
        
        if(Player1.contains(2) && Player1.contains(5) && Player1.contains(8)){
            winner = 1
        }
        
        if(Player2.contains(2) && Player2.contains(5) && Player2.contains(8)){
            winner = 2
        }
        
        if(Player1.contains(3) && Player1.contains(6) && Player1.contains(9)){
            winner = 1
        }
               
        if(Player2.contains(3) && Player2.contains(6) && Player2.contains(9)){
            winner = 2
        }
        
        if winner != -1{
            var msg = ""
            
            if winner == 1{
                msg = "Player 1 is win"
            }else{
                msg = "Player 2 is win"
            }
            print(msg)
            
            let alert = UIAlertController(title: "Você ganhou!", message: msg, preferredStyle:
                UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func AutoPlay(){
        var emptyCells = [Int]()
        
        for index in 1...9{
            if !(Player1.contains(index) || Player2.contains(index)){
                emptyCells.append(index)
            }
        }
        
        let randIndex = arc4random_uniform(UInt32(emptyCells.count))
        let cellID = emptyCells[Int(randIndex)]
        var btnSelect:UIButton?
        
        switch cellID {
        case 1:
            btnSelect = btn1
        case 2:
            btnSelect = btn2
        case 3:
            btnSelect = btn3
        case 4:
            btnSelect = btn4
        case 5:
            btnSelect = btn5
        case 6:
            btnSelect = btn6
        case 7:
            btnSelect = btn7
        case 8:
            btnSelect = btn8
        case 9:
            btnSelect = btn9
        default:
            btnSelect = btn1}
        play(btnSelect: btnSelect!)
        
    }
    
    
}

