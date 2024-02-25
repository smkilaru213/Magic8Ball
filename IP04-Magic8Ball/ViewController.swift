//
//  ViewController.swift
//  IP04-Magic8Ball
//
//  Created by SaiManasa on 9/28/23.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var show = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBOutlet var text: UILabel!
    
    fileprivate func updateUI() {
        view.backgroundColor = .black
        text.textColor = .white
        text.text = "Think of a question & shake the phone to get an answer!"
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake && !show {
            let answers: [String] = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Signs point to yes", "Reply hazy, try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don’t count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]
            
            let randomNum = answers.randomElement()!
            text.text = randomNum
            show = true
            
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: false)
        }
    }
    
    @objc fileprivate func timerFunction() {
        show = false
        updateUI()
    }
}
