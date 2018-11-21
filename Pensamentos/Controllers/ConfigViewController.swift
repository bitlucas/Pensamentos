//
//  ConfigViewController.swift
//  Pensamentos
//
//  Created by Lucas Bitar on 03/09/18.
//  Copyright © 2018 Lucas Bitar. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    @IBOutlet weak var swMudarAutomaticamente: UISwitch!
    
    @IBOutlet weak var slTimer: UISlider!
    @IBOutlet weak var lbTimer: UILabel!
    @IBOutlet weak var scCor: UISegmentedControl!
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    func formatView(){
        swMudarAutomaticamente.setOn(config.autorefresh, animated: true)
        slTimer.setValue(Float(config.timeInterval), animated: true)
        scCor.selectedSegmentIndex = config.colorScheme
        formatLabelTimer(with: Int(config.timeInterval))
        print(config.autorefresh)
        print(config.timeInterval)
        print(config.colorScheme)
    }
    
    func formatLabelTimer(with value: Int){
        lbTimer.text = "Mudar após \(value) segundos"
    }
    
    @IBAction func mudarAutomaticamente(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    
    @IBAction func timer(_ sender: UISlider) {
        let value = Double(sender.value)
        config.timeInterval = value
        formatLabelTimer(with: Int(value))
        
    }
    
    @IBAction func esquemaDeCores(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
}
