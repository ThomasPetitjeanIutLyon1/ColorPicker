//
//  ColorPickerViewController.swift
//  ColorPicker
//
//  Created by lpiem on 24/01/2019.
//  Copyright © 2019 lpiem. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    weak var delegate: ColorPickerViewDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func greenBtn(_ sender: Any) {
        delegate?.userDidChooseColor(color :ColorAsset.green.color);
    }
    
    
    @IBAction func orangeBtn(_ sender: Any) {
        delegate?.userDidChooseColor(color :ColorAsset.orange.color);
    }
    
    @IBAction func purpleBtn(_ sender: Any) {
        delegate?.userDidChooseColor(color :ColorAsset.purple.color);
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol ColorPickerViewDelegate: class {
    func userDidChooseColor(color: UIColor);
}



