//
//  ViewController.swift
//  Calculator
//
//  Created by Анастасия Болбот on 24.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen:Double = 0;
    var firstNum:Double = 0;
    var operation:Int = 0;
    var mathSign:Bool = false;
    var dotIsPlaced = false;
    var valueBin = 0
    
    @IBOutlet weak var result: UILabel!
    
    
    @IBAction func percentBuyyon(_ sender: UIButton) {
        if var text = result.text, var value = Double(text){
            result.text = String(value/100)
        }
    }
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
            if sender.tag == 16 {
                if !(result.text?.contains("."))! {
                    result.text = result.text! + "."
                }
            }
            else {
                result.text = result.text! + String(sender.tag)
            }
        }
        numberFromScreen = Double(result.text!)!
    }
    
    
    @IBAction func dot(_ sender: UIButton) {
        if !(result.text?.contains("."))! {
            result.text = result.text! + "."
        }
    }
    @IBAction func button(_ sender: UIButton)
    {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            
            if sender.tag == 11 {//ділення
                result.text = "/";
            }
            else if sender.tag == 12 {//множення
                result.text = "*";
            }
            else if sender.tag == 13 {//віднімання
                result.text = "-";
            }
            else if sender.tag == 14 {//додавання
                result.text = "+";
            }
            else if sender.tag == 17 {
                result.text = "√"
            }
            else if sender.tag == 20 {
                result.text = "bin"
            }
            
            operation = sender.tag
            mathSign = true;
        }
        
        else if sender.tag == 15{
            if operation == 11{
                result.text = String(firstNum / numberFromScreen)
            }
            else if operation == 12{
                result.text = String(firstNum * numberFromScreen)
            }
            else if operation == 13{
                result.text = String(firstNum - numberFromScreen)
            }
            else if operation == 14{
                result.text = String(firstNum + numberFromScreen)
            }
            else if operation == 17{
                result.text = String(sqrt(numberFromScreen))
            }
            else if operation == 20{
                valueBin = Int(numberFromScreen)
                result.text = String(valueBin, radix: 2)
                
                
            }
            
        }
        else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
        
    }
    
    
    
    
    
}

