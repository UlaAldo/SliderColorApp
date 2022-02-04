//
//  ViewController.swift
//  SliderColorApp
//
//  Created by Юлия Алдохина on 17/01/22.
//

import UIKit

class SettingsViewController: UIViewController {

// MARK: - IB Outlets
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var redTextField: UITextField!
    
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var greenTextField: UITextField!
    
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var doneButton: UIButton!
    
// MARK: - Public Properties
    var delegate: SettingsVCDelegate!
    var acceptColor: UIColor!
    
// MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 10
        
        viewColor.backgroundColor = acceptColor
        
        colorTransfer()
        setValueLabel(for: [redLabel, greenLabel, blueLabel])
        setValueTextField(for: [redTextField, greenTextField, blueTextField])
        changeColorView()
        
    }
// MARK: - IB Actions
    @IBAction func redSliderMove() {
        redLabel.text = string(from: redSlider)
        redTextField.text = string(from: redSlider)
        changeColorView()
    }

    @IBAction func greenSliderMove() {
        greenLabel.text = string(from: greenSlider)
        greenTextField.text = string(from: greenSlider)
        changeColorView()
    }

    @IBAction func blueSliderMove() {
        blueLabel.text = string(from: blueSlider)
        blueTextField.text = string(from: blueSlider)
        changeColorView()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(from: viewColor.backgroundColor ?? .blue)
        dismiss(animated: true)
    }
// MARK: - Private Methods
    private func changeColorView() {
    viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                        green: CGFloat(greenSlider.value),
                                        blue: CGFloat(blueSlider.value),
                                        alpha: 1)
}
    
    private func setValueLabel(for labels: [UILabel]) {
        for label in labels {
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValueTextField(for textFields: [UITextField]) {
        for textField in textFields {
            switch textField {
            case redTextField:
                redTextField.text = string(from: redSlider)
            case greenTextField:
                greenTextField.text = string(from: greenSlider)
            default:
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func colorTransfer() {
        let color = CIColor.init(color: acceptColor)
        redSlider.value = Float(color.red)
        greenSlider.value = Float(color.green)
        blueSlider.value = Float(color.blue)
    }
   
}
