//
//  ViewController.swift
//  ColorPicker
//
//  Created by lpiem on 24/01/2019.
//  Copyright © 2019 lpiem. All rights reserved.
//

protocol SegueHandlerType {
    
    // `typealias` has been changed to `associatedtype` for Protocols in Swift 3.
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    // This used to be `performSegueWithIdentifier(...)`.
    func performSegue(withIdentifier identifier: SegueIdentifier, sender: Any?) {
        performSegue(withIdentifier: identifier.rawValue, sender: sender)
    }
    
    func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Couldn't handle segue identifier \(String(describing: segue.identifier)) for view controller of type \(type(of: self)).")
        }
        
        return segueIdentifier
    }
}


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(for: segue) {
        case .pickAColor:
            let controller = segue.destination as! ColorPickerViewController
            controller.delegate = self
            break
        
        }
    }


}

extension ViewController : ColorPickerViewDelegate {
    func userDidChooseColor(color: UIColor) {
        dismiss(animated: true, completion: nil)
        
        let previousColor = view.backgroundColor
        self.view.backgroundColor = color
        let alert = UIAlertController(title: "Couleur", message: "Garder cette couleur ?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Oui", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Non", style: UIAlertAction.Style.cancel, handler: { action in
            switch action.style{
            case .default:
                print("default")
            case .cancel:
                UIView.animate(withDuration: 1, animations: {
                    self.view.backgroundColor = previousColor
                })
            case .destructive:
                print("destructive")
            }}))
        
        self.present(alert, animated: true, completion: nil)
        
    }
}

extension ViewController: SegueHandlerType {
    
    enum SegueIdentifier: String {
        case pickAColor
    }
}
