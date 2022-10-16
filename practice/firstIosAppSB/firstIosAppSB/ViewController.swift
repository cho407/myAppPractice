//
//  ViewController.swift
//  firstIosAppSB
//
//  Created by 조형구 on 2022/10/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func pressSayHello(_ sender: Any) {
        
        //nil : 시험지 자체를 제출하지 않는것
        //"" : 시험지를 백지를 내는 것
        let myString = myTextField.text ?? "Hello World"
        
        print(myString)
        
        myLabel.text = myString
        
        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: myString)
        
        
        synthesizer.speak(utterance)
        
    }
}

