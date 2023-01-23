//
//  SignUpVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 21/01/23.
//

import Foundation
import UIKit

extension SignUpVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dateOfBirth{
            datePicker(textField: textField)
        }
    }
    
    func datePicker(textField: UITextField){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        textField.inputView = datePicker
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YYYY-MM-dd"
        datePicker.maximumDate = dateFormat.date(from: "2005-01-01")
        datePicker.minimumDate = dateFormat.date(from: "1965-01-01")
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancel))
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.done))
        
        let flexiblebtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
                
        toolbar.setItems([cancelBtn,flexiblebtn,doneBtn], animated: true)
        textField.inputAccessoryView = toolbar
    }

    @objc func done(){
    
        if let datePicker = dateOfBirth.inputView as? UIDatePicker{
            let dateformatter  = DateFormatter()
            dateformatter.dateStyle = .short
            dateformatter.dateFormat = "YYYY-MM-dd"
            dateOfBirth.text = dateformatter.string(from: datePicker.date)
            dateOfBirth.resignFirstResponder()
        }
        
    }
    @objc func cancel(){
        dateOfBirth.resignFirstResponder()
    }
}



