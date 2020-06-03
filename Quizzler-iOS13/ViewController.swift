//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let quiz = [
    Question(text: "Four + Two is equal to Six.", answer: "True"),
    Question(text: "Five - Three is greater than One.", answer: "True"),
    Question(text: "Three + Eight is less than Ten.", answer: "False")
  ]
  
  var questionNumber = 0
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressBar: UIProgressView!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view.
    updateUI()
    }

  @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    let userAnswer = sender.currentTitle // True, False
    let actualAnswer = quiz[questionNumber].answer
    
    if userAnswer == actualAnswer {
      print("Right")
    } else {
      print("Wrong")
    }
    
//    if questionNumber < quiz.count - 1 {
//      questionNumber += 1
//    } else {
//      questionNumber = 0 // starts from the beginning again
//    }
    questionNumber = (questionNumber + 1) % quiz.count // run questions from beggining
    updateUI()
  }
  
  func updateUI() {
    questionLabel.text = quiz[questionNumber].text
  }
}

