//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var quizBrain = QuizBrain()
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressBar: UIProgressView!
  
  @IBOutlet weak var choice1: UIButton!
  @IBOutlet weak var choice2: UIButton!
  @IBOutlet weak var choice3: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    updateUI()
  }

  @IBAction func answerButtonPressed(_ sender: UIButton) {
    sender.layer.cornerRadius = 0.3 * sender.bounds.size.height     // make rounded red/green button

    let userAnswer = sender.currentTitle! // e.x: "Heart", "Skin", "Large"
    //    let userAnswer = sender.tag // e.x: 0, 1, 2

    let userGotItRigh = quizBrain.checkAnswer(userAnswer)
    
    userGotItRigh ? (sender.backgroundColor = UIColor.green) : (sender.backgroundColor = UIColor.red)

    quizBrain.nextQuestion()
        
    //    no need var when runs once, run updateUI in the Timer method
    Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
  }
  
  @objc func updateUI() {
    questionLabel.text = quizBrain.getQuestionText()
    progressBar.progress = quizBrain.getProgress()
    
    //    give name buttons based on question's choice
    let choiceText = quizBrain.getAnswersArr()
    choice1.setTitle(choiceText[0], for: .normal)
    choice2.setTitle(choiceText[1], for: .normal)
    choice3.setTitle(choiceText[2], for: .normal)

    scoreLabel.text = "Score: \(quizBrain.getScore())"
    
    choice1.backgroundColor = UIColor.clear
    choice2.backgroundColor = UIColor.clear
    choice3.backgroundColor = UIColor.clear
  }
}

//    change back the colour of buttons
//    ...if...
//      sender.backgroundColor = UIColor.green
//      DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//        self.sender.backgroundColour = UIColor.clear
//      }
