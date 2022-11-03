//
//  ViewController.swift
//  switchMode
//
//  Created by Тимур Гарипов on 18.10.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var styleSegmentControl: UISegmentedControl!
    @IBOutlet weak var image: UIImageView!
    
    let defaults = UserDefaults.standard
    let prefersDarkMode = "PrefersDarkMode"
    var isDarkMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageView()
        checkForSyylePreference()
    }

    func setImageView(){
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.layer.borderWidth = 0.5
    }
    
    func updateStyle() {
        UIView.animate(withDuration: 0.4) {
            self.view.backgroundColor = self.isDarkMode ?  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 0.7893710732, green: 0.6916279197, blue: 0.6182821393, alpha: 1)
            self.image.image = self.isDarkMode ? UIImage(named: "Polycarbonate") : UIImage(named: "Image1")
        }
    }
    
    func saveStylePreference() {
        defaults.set(isDarkMode, forKey: prefersDarkMode)
    }
    
    func checkForSyylePreference() {
        let preferDarkMode = defaults.bool(forKey: prefersDarkMode)
        
        if preferDarkMode {
            isDarkMode = true
            updateStyle()
            styleSegmentControl.selectedSegmentIndex = 1
        }
    }
    
    @IBAction func switchMode(_ sender: UISegmentedControl) {
        isDarkMode = sender.selectedSegmentIndex == 1
        saveStylePreference()
        updateStyle()
    }
    
}

