//
//  ShoppingListViewCell.swift
//  ShoppingList
//
//  Created by Samuel Sum on 2022-10-27.
//

import UIKit

protocol ShoppingListViewCellDelegate: AnyObject {
    func didChangeStepperValue(with tag: Int, value: Double)
}

class ShoppingListViewCell: UITableViewCell {

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
    
    func configure(with item: ShoppingItem, row: Int) {
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
}
