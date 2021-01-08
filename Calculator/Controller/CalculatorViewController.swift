//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Claudia Maciel on 1/7/21.
//

import UIKit

class CalculatorViewController: UIViewController {

    //MARK: - Properties
    var currentNumber = 0
    var previousNumber = 0
    var operationToPerform = ""
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var buttonPushedLabel: UILabel!
    @IBOutlet var lightDarkMode: UISegmentedControl!
    
    //MARK: - Actions
    
    @IBAction func lightDarkSegment(_ sender: Any) {
        if lightDarkMode.selectedSegmentIndex == 0 {
            overrideUserInterfaceStyle = .light
        } else {
            overrideUserInterfaceStyle = .dark
        }
    }
    @IBAction func clearButtonPressed(_ sender: Any) {
        currentNumber = 0
        previousNumber = 0
        operationToPerform = ""
        answerLabel.text = ""
        buttonPushedLabel.text = ""
    }
    @IBAction func DivideButtonPressed(_ sender: Any) {
        answerLabel.text = ""
        operationToPerform = "/"
        if currentNumber == 0 {
            answerLabel.text = "ERROR"
        } else if previousNumber == 0 {
            previousNumber = currentNumber
            buttonPushedLabel.text! += "/"
        } else {
            previousNumber /= currentNumber
            currentNumber = 0
        }
    }
    @IBAction func MultiplyButtonPressed(_ sender: Any) {
        answerLabel.text = ""
        operationToPerform = "*"
        if currentNumber == 0 {
            answerLabel.text = "ERROR"
        } else if previousNumber == 0 {
            previousNumber = currentNumber
            currentNumber = 0
            buttonPushedLabel.text! += "x"
        } else {
            previousNumber *= currentNumber
            currentNumber = 0
        }
    }
    @IBAction func MinusButtonPressed(_ sender: Any) {
        answerLabel.text = ""
        operationToPerform = "-"
        if currentNumber == 0 {
            answerLabel.text = "ERROR"
        } else if previousNumber == 0 {
            previousNumber = currentNumber
            currentNumber = 0
            buttonPushedLabel.text! += "-"
        } else {
            previousNumber -= currentNumber
            currentNumber = 0
        }
    }
    @IBAction func PlusButtonPressed(_ sender: Any) {
        answerLabel.text = ""
        operationToPerform = "+"
        if currentNumber == 0 {
            answerLabel.text = "ERROR"
        } else if previousNumber == 0 {
            previousNumber = currentNumber
            currentNumber = 0
            buttonPushedLabel.text! += "+"
        } else {
            previousNumber += currentNumber
            currentNumber = 0
        }
    }
    @IBAction func EqualsButtonPressed(_ sender: Any) {
        if currentNumber != 0 {
            switch operationToPerform {
            case "+":
                previousNumber += currentNumber
            case "-":
                previousNumber -= currentNumber
            case "/":
                previousNumber /= currentNumber
            case "*":
                previousNumber *= currentNumber
            default:
                break
            }
        }
        answerLabel.text = String(previousNumber)
        currentNumber = 0
        previousNumber = 0
        operationToPerform = ""
        
    }
    @IBAction func NumberButtonPressed(_ sender: UIButton) {
        answerLabel.text! += String(sender.tag - 1)
        currentNumber = Int(answerLabel.text!)!
        buttonPushedLabel.text! += String(sender.tag - 1)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
