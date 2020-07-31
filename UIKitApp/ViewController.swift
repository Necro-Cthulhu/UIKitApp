//
//  ViewController.swift
//  UIKitApp
//
//  Created by Никита Груздев on 31.07.2020.
//  Copyright © 2020 Никита Груздев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var hideSwitch: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Работа с Label
        mainLabel.text = String(slider.value)
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Работа с Segmented Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Работа с Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        // Работа с DatePicker. Идентефикаторы стран можно найти на гитхаб
        datePicker.locale = Locale(identifier: "ru_RU")
        
        // Работа со Switch
        hideSwitch.onTintColor = .red
}
    @IBAction func chooseSegment() {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .yellow
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .blue
        default:
            break
        }
    }
    

    @IBAction func sliderAction() {
        
        mainLabel.text = String(slider.value)
        let sliderValue = CGFloat(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
        
    }
    
    @IBAction func doneButtonPressed() {
        
        guard let inputText = userNameTextField.text, !inputText.isEmpty else {
            
            showAlert(with: "Text field is empty", and: "Please enter your name")
            print("Text field is empty")
            return
            
        }
        
        if let _ = Double(inputText) {
            
            showAlert(with: "Wrong format", and: "Please enter your name")
            print("Wrong format")
            return
            
        }
        
        mainLabel.text = inputText
        userNameTextField.text = ""
        
        }
    
    @IBAction func chooseDate() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale(identifier: "ru_RU")
        mainLabel.text = dateFormatter.string(from: datePicker.date)
        
    }
  
    @IBAction func switchAction() {
        
        stackView.isHidden.toggle()
        
        switchLabel.text = hideSwitch.isOn ? "Show all elements" : "Hide all elements"
        
    }
    
}

// Делаем расширение(extension) для добавления AlertController, т.к. его нет в библиотеках + кнопка, чтобы убрать AlertController с экрана

// MARK: - UIAlertController

extension ViewController {
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

