//
//  SettingsViewController.swift
//  tippy
//
//  Created by Kim Pham (kixton) on 9/14/16.
//  Copyright © 2016 Kim Pham (kixton). All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipAmountControl: UISegmentedControl!

    @IBAction func calculateDefaultTipAmount(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(tipAmountControl.selectedSegmentIndex, forKey: "defaultTipAmount")
        defaults.synchronize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        tipAmountControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipAmount")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
