//
//  ViewController.swift
//  MathGeni
//
//  Created by Bilgihan Köse on 8.03.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   var question:String?
    var realResult:Int?
      var fakeResult1:Int?
      var fakeResult2: Int?
      var number1: Int?
      var number2: Int?
   
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //rastgele iki sayi cikar
        number1 = Int.random(in: 0 ..< 20)
        number2 = Int.random(in: 0 ..< 20)
        
        
        //bunun toplamini soru olarak hesaplayip ekrana yaz
        question = "\(number1!) + \(number2!) = ?"
        print(question!)
        questionLabel.text = question
        
        
        //buton icin sonuclar hesapla
        realResult = number1! + number2!
        fakeResult1 = realResult! - 2
        fakeResult2 = realResult! + 1
        
        print(realResult!)
        print(fakeResult1!)
        print(fakeResult2!)
        
        
        
        
        //button degerlerini ata
        answer1.setTitle(String(fakeResult1!), for: .normal)
        answer2.setTitle(String(realResult!), for: .normal)
        answer3.setTitle(String(fakeResult2!), for: .normal)
  
    }

    @IBAction func answer1(_ sender: UIButton) {
        
    if sender.currentTitle == String(realResult!) {
            answer1.backgroundColor = UIColor.green
    } else {
        answer1.backgroundColor = UIColor.red
        }
}

    @IBAction func answer2(_ sender: UIButton) {
        
        if sender.currentTitle == String(realResult!) {
                answer2.backgroundColor = UIColor.green
        } else {
            answer2.backgroundColor = UIColor.red
            }
        
    }
    
    @IBAction func answer3(_ sender: UIButton) {
        
        if sender.currentTitle == String(realResult!) {
                answer3.backgroundColor = UIColor.green
        } else {
            answer3.backgroundColor = UIColor.red
            }
    }
    
    
}
