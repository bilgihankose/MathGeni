//
//  ViewController.swift
//  MathGeni
//
//  Created by Bilgihan Köse on 8.03.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  //   let backgroundImageView = UIImageView()
   var question:String?
    var realResult:Int?
      var fakeResult1:Int?
      var fakeResult2: Int?
      var number1: Int?
      var number2: Int?
    var array: Array<Int>?
    var countdown = 10
    var gameStatus = true
    var gameTimeTimer = Timer()
    var trueNumber = 0
    var falseNumber = 0
    
      
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var countDownTimer: UILabel!
    @IBOutlet weak var trueLabel: UILabel!
    @IBOutlet weak var falseLabel: UILabel!
    
    
    
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    //  setBackground()
        countDownTimer.text = String(countdown)
    createQuestion()
   gameTimeTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(countDownTime), userInfo:nil, repeats: true)
    
    }
  /*  //Ekranin her yerini kaplayan backgorund ata. Bunu programatticly yapmanin avantaji eger bunu storyboardda yapsaydik, arkada koca bi uiview olacakti bir yere tiklarken yanlislikla ona tiklayabilirdik.
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo:  view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "background2")
        
    }  */


    @IBAction func answer1(_ sender: UIButton) {
        
    if sender.currentTitle == String(realResult!) {
            answer1.backgroundColor = UIColor.green
        trueNumber = trueNumber + 1
        trueLabel.text = "True: \(trueNumber)"

    } else {
        answer1.backgroundColor = UIColor.red
        gameStatus = false
        falseNumber = falseNumber + 1
        falseLabel.text = "False: \(falseNumber)"
        alert()
        }
         Timer.scheduledTimer(timeInterval: 0.7, target: self, selector:#selector(updateUI), userInfo:nil, repeats: false)
         Timer.scheduledTimer(timeInterval: 0.8, target: self, selector:#selector(createQuestion), userInfo:nil, repeats: false)
        
}

    @IBAction func answer2(_ sender: UIButton) {
        
        if sender.currentTitle == String(realResult!) {
                answer2.backgroundColor = UIColor.green
            trueNumber = trueNumber + 1
                   trueLabel.text = "True: \(trueNumber)"

        } else {
            answer2.backgroundColor = UIColor.red
              gameStatus = false
            falseNumber = falseNumber + 1
            falseLabel.text = "False: \(falseNumber)"
            alert()
            }
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector:#selector(updateUI), userInfo:nil, repeats: false)
         
       Timer.scheduledTimer(timeInterval: 0.8, target: self, selector:#selector(createQuestion), userInfo:nil, repeats: false)
        
    }
    
    @IBAction func answer3(_ sender: UIButton) {
        
        if sender.currentTitle == String(realResult!) {
                answer3.backgroundColor = UIColor.green
 trueNumber = trueNumber + 1
        trueLabel.text = "True: \(trueNumber)"
        } else {
            answer3.backgroundColor = UIColor.red
              gameStatus = false
            falseNumber = falseNumber + 1
                   falseLabel.text = "False: \(falseNumber)"
            alert()
            }
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector:#selector(updateUI), userInfo:nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 0.8, target: self, selector:#selector(createQuestion), userInfo:nil, repeats: false)
       
    
    }
    
    @objc func updateUI() {
        answer1.backgroundColor = UIColor.link
        answer2.backgroundColor = UIColor.link
        answer3.backgroundColor = UIColor.link
        countdown = 10
        countDownTime()
      
    }
    
    
    
    
    @objc func createQuestion (){
        if gameStatus == true {
          //rastgele iki sayi cikar
              number1 = Int.random(in: 10 ..< 51)
              number2 = Int.random(in: 10 ..< 51)
              
              
              //bunun toplamini soru olarak hesaplayip ekrana yaz
              question = "\(number1!) + \(number2!) = ?"
              print(question!)
              questionLabel.text = question
              
              
              //buton icin sonuclar hesapla
              realResult = number1! + number2!
              fakeResult1 = realResult! - 4
              fakeResult2 = realResult! + 10
              
              array = [realResult!, fakeResult1!, fakeResult2!].shuffled()
              
            /*
              print(array!.randomElement()!)
              
              print(array!.randomElement()!)
              print(array!.randomElement()!)
              print(fakeResult1!)
              print(fakeResult2!)
              
              */
              
              
              //button degerlerini ata
              answer1.setTitle(String(array![0]), for: .normal)
              answer2.setTitle(String(array![1]), for: .normal)
              answer3.setTitle(String(array![2]), for: .normal)
     
        
    }
    }
    
    @objc func countDownTime(){
        if (countdown > 0 ) && gameStatus == true {
            countdown = countdown - 1
            countDownTimer.text = String(countdown)
        }  else if (countdown == 0) {
            gameStatus = false
            gameTimeTimer.invalidate()
           alert()
           }
        
        
    }
    
    func alert(){
        
        // Create the alert controller
        let alertController = UIAlertController(title: "Game Over", message: "Do you wanna play again?", preferredStyle: .alert)

           // Create the actions
        let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
               UIAlertAction in
            self.gameStatus = true
            self.createQuestion()
            self.countdown = 10
            self.countDownTimer.text = String(self.countdown)
           }
    

           // Add the actions
           alertController.addAction(okAction)

           // Present the controller
        self.present(alertController, animated: true, completion: nil)
        
       
    }
   
    
    
    
}


