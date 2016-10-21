//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    @IBOutlet weak var fruitPicker: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return fruitsArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        self.fruitPicker.delegate = self
        self.fruitPicker.dataSource = self
        
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count))), inComponent: 0, animated: true)
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count))), inComponent: 1, animated: true)
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count))), inComponent: 2, animated: true)
    
        if fruitPicker.selectedRow(inComponent: 0) == fruitPicker.selectedRow(inComponent: 1) &&
            fruitPicker.selectedRow(inComponent: 1) == fruitPicker.selectedRow(inComponent: 2) {
            resultLabel.text = "WINNER!"
        } else {
            resultLabel.text = "TRY AGAIN"
        }
        }
    }
    
    

    
    


// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



