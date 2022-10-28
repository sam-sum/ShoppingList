//
//  ShoppingListViewCell.swift
//  ShoppingList
//
//  Created by Samuel Sum on 2022-10-27.
//

import UIKit

protocol ShoppingListViewCellDelegate: AnyObject {
    func didChangeStepperValue(with tag: Int, value: Double)
    func textFieldDidEndEditing(with tag: Int, value: String)
}

class ShoppingListViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var txtDesc: UITextField!
    @IBOutlet weak var lblStepper: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    private var tagStepper: Int = 0
    private var tagTxtDesc: Int = 0

    weak var delegate: ShoppingListViewCellDelegate?
    
    static let identifier = "ShoppingListViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "ShoppingListViewCell", bundle: nil)
    }
    @IBAction func didChangeStepperValue(_ sender: UIStepper) {
        lblStepper.text = String (format:"%.f", stepper.value)
        delegate?.didChangeStepperValue(with: tagStepper, value: sender.value)
    }
    
    @IBAction func textFieldDidEndEditing(_ sender: UITextField) {
        delegate?.textFieldDidEndEditing(with: tagTxtDesc, value: sender.text ?? "")
    }
    
    func configure(with item: ShoppingItem, row: Int) {
        txtDesc.delegate = self
        self.tagStepper = row
        self.tagTxtDesc = row
        stepper.tag = row
        stepper.value = Double(item.qty)
        lblStepper.text = String (format:"%.f", stepper.value)
        txtDesc.text = item.desc
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //self.view.endEditing(true)
        return true
    }
}
