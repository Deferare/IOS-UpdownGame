//
//  ViewController.swift
//  UpDonwGame
//
//  Created by Ubinyou on 2021/03/07.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue = 0
    var countValue = 0
    @IBOutlet var minValueLabel:UILabel!
    @IBOutlet var maxValueLabel:UILabel!
    @IBOutlet weak var tryCountLabel:UILabel!
    @IBOutlet weak var sliderValueLabel:UILabel!
    @IBOutlet weak var slider:UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }
    
    func showAlert(message:String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func reset(){
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        
        randomValue = Int.random(in: 0...30)
        countValue = 0
        minValueLabel.text = String(slider.minimumValue)
        maxValueLabel.text = String(slider.maximumValue)
        sliderValueLabel.text = String(Int(slider.value))
        tryCountLabel.text = "0 / 5"
    }
    
    @IBAction func slideValueChanged(sender : UISlider){
        sliderValueLabel.text = String(Int(slider.value))
    }
    @IBAction func touchUpHitButton(btn : UIButton) {
        var userValue = Int(slider.value);
        print("User : \(userValue)")
        print("Com : \(randomValue)")
        countValue += 1
        tryCountLabel.text = "\(countValue) / 5"
        if (userValue == randomValue) {
            showAlert(message: "You win!!")
            reset()
            return
        }
        else if (countValue > 5) {
            showAlert(message: "You lose!!")
            reset()
            return
        }
        
        if (userValue > randomValue) {
            
            slider.maximumValue = Float(userValue)
            maxValueLabel.text = String(userValue)
        }
        else if (userValue < randomValue) {
            slider.minimumValue = Float(userValue)
            minValueLabel.text = String(userValue)
        }
    }
    @IBAction func touchUpReset(btn : UIButton) {
        print("Touch Up reset Btn!")
        reset()
    }
}

