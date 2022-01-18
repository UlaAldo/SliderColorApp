//
//  ViewController.swift
//  SliderColorApp
//
//  Created by Юлия Алдохина on 17/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var redNumber: UILabel!
    @IBOutlet var redSlider: UISlider!
    
    @IBOutlet var greenNumber: UILabel!
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var blueNumber: UILabel!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 10
    }
    

    @IBAction func redSliderMove() {
        redNumber.text = String(format: "%.2f", redSlider.value)
        changeColorView()
    }
    
    @IBAction func greenSliderMove() {
        greenNumber.text = String(format: "%.2f", greenSlider.value)
        changeColorView()
    }
    
    @IBAction func blueSliderMove() {
        blueNumber.text = String(format: "%.2f", blueSlider.value)
        changeColorView()
    }
    
    private func changeColorView() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
    viewColor.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
}
}

