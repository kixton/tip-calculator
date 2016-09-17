//
//  ViewController.swift
//  tippy
//
//  Created by Kim Pham (kixton) on 9/13/16.
//  Copyright © 2016 Kim Pham (kixton). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField .becomeFirstResponder()
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipAmount")
        calculateTip()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func billFieldChanged(_ sender: AnyObject) {
        let textNumber = Double(billField.text!) ?? 0
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let newText = formatter.string(from: NSNumber(value: textNumber))
        billField.text = newText
    }

    func formatNumber(dub: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: dub))
    }

    func calculateTip() {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        tipLabel.text = formatNumber(dub: tip)
        totalLabel.text = formatNumber(dub: total)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        calculateTip()
    }

}

