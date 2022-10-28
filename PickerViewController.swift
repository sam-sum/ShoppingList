//
//  MAPD714 F22
//  Mid-term Test
//  Student: Sum, Chi Hung (Samuel) 300858503
//  Date:   Oct 30, 2022
//
//  PickerViewController.swift
//  Shopping List with perset favourite items
//  Version 1.0
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    
    private var categoryNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        
        for name in Category.allValues {
            //print(name.toString())
            categoryNames.append(name.toString())
        }
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryNames[row]
    }

    @IBAction func onButtonPressed(_ sender: UIButton) {
        let row = picker.selectedRow(inComponent: 0)
        //print("Picker View button: \(row)")
        if let vc = presentingViewController as? ViewController {
            //before dismissing the Form ViewController, pass the data inside the closure
            dismiss(animated: true, completion: {
                vc.didFinishSelection(index: row)
            })
        }
    }
}
