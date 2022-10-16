//
//  Calculator.swift
//  calculatorSB
//
//  Created by 조형구 on 2022/10/16.
//

import Foundation

struct Calculator {
    // 밖에서 정의할 내용
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var operation: CalcOperation = .plus
    
    // 나중에 계산/연산 프로퍼티로 만들어줄 내용
    var result: Int {
        get {
            switch operation {
            case .plus:
                return firstNumber + secondNumber
            case .minus:
                return firstNumber - secondNumber
            case .multiply:
                return firstNumber * secondNumber
            case .divide:
                if secondNumber == 0 {
                    return 0
                } else {
                    return firstNumber / secondNumber
                }
            case .square:
                var temp: Int = 1
                for _ in 0..<secondNumber {
                    temp = temp * firstNumber
                }
                return temp
            case .remain:
                return firstNumber % secondNumber
            }
        }
    }
    
    var resultString: String {
        get {
            switch operation {
            case .plus:
                return "\(firstNumber) + \(secondNumber) = \(result)"
            case .minus:
                return "\(firstNumber) - \(secondNumber) = \(result)"
            case .multiply:
                return "\(firstNumber) x \(secondNumber) = \(result)"
            case .divide:
                return "\(firstNumber) / \(secondNumber) = \(result)"
            case .square:
                return "\(firstNumber) ^ \(secondNumber) = \(result)"
            case .remain:
                return "\(firstNumber) % \(secondNumber) = \(result)"
            }
        }
    }
    
    var speechString: String {
        get {
            switch operation {
            case .plus:
                return "\(firstNumber)에 \(secondNumber)를 더하면 \(result)입니다."
            case .minus:
                return "\(firstNumber)에 \(secondNumber)를 빼면 \(result)입니다."
            case .multiply:
                return "\(firstNumber)에 \(secondNumber)를 곱하면 \(result)입니다."
            case .divide:
                return "\(firstNumber)를 \(secondNumber)로 나누면 \(result)입니다."
            case .square:
                return "\(firstNumber)의 \(secondNumber)승은 \(result)입니다."
            case .remain:
                return "\(firstNumber)를 \(secondNumber)로 나고 남은 값은 \(result)입니다."
            }
        }
    }
    
    init(first: Int, second: Int, operation: CalcOperation) {
        self.firstNumber = first
        self.secondNumber = second
        self.operation = operation
    }
}

