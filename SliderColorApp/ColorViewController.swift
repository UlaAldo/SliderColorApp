//
//  ColorViewController.swift
//  SliderColorApp
//
//  Created by Юлия Алдохина on 02/02/22.
//

import UIKit

protocol SettingsVCDelegate {
    func setColor (from color: UIColor)
}

class ColorViewController: UIViewController {
    
// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.acceptColor = view.backgroundColor
    }
}

// MARK: - protocol SettingsVCDelegate
extension ColorViewController: SettingsVCDelegate {
    func setColor(from color: UIColor) {
        view.backgroundColor = color
    }
}
