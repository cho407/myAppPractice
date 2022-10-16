//
//  ViewController.swift
//  calculatorSB
//
//  Created by 조형구 on 2022/10/15.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()

   
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //이 화면이 띄워질 때 해야할 일들을 적는다
       

    }
    
    func getNumbers() -> (Int, Int){
        // fistTextField.text는 String?의 옵셔널 타입이므로
        // 그냥 꺼내올 수 없다
        // 그래서 fistTextField.text는 옵셔널 바인딩으로 꺼낼올 수 있으면
        // 그대로 firstText에 복제할당하고
        // nil이라서 실패하면 ?? 뒤의 "0"을 복제할당한다
        let firstText: String = firstTextField.text ?? "0"
        let firstNumber: Int = Int(firstText) ?? 0
        
        let secondText: String = secondTextField.text ?? "0"
        let secondNumber: Int = Int(secondText) ?? 0
        
        return (firstNumber, secondNumber)
        
    }
    
    // 보여주고 음성합성기로 읽어주기까지 하자
    func showResult(calc: Calculator) {
        resultLabel.text = calc.resultString
        speechResult(speechText: calc.speechString)
    }
    
    // 음성합성기를 이용해서 결과를 읽어보자!
    func speechResult(speechText: String) {
        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: speechText)
        synthesizer.speak(utterance)
    }

    @IBAction func pressPlusButton(_ sender: Any) {
      
        let calculator = Calculator(first: getNumbers().0, second: getNumbers().1, operation: .plus)
        showResult(calc: calculator)
    }
    
    @IBAction func pressMinusButton(_ sender: Any) {
        let calculator = Calculator(first: getNumbers().0, second: getNumbers().1, operation: .minus)
        showResult(calc: calculator)
    }
    
    @IBAction func pressMultiplyButton(_ sender: Any) {
        let calculator = Calculator(first: getNumbers().0, second: getNumbers().1, operation: .multiply)
        showResult(calc: calculator)
    }
    
    @IBAction func pressDivideButton(_ sender: Any) {
        let calculator = Calculator(first: getNumbers().0, second: getNumbers().1, operation: .divide)
        showResult(calc: calculator)
    }
    
    @IBAction func pressSquareButton(_ sender: Any) {
        let calculator = Calculator(first: getNumbers().0, second: getNumbers().1, operation: .square)
        showResult(calc: calculator)
    }
    
    @IBAction func pressRemainButton(_ sender: Any) {
        let calculator = Calculator(first: getNumbers().0, second: getNumbers().1, operation: .remain)
        showResult(calc: calculator)
    }
}

