//
//  DatePickerTextField.swift
//  BuddyGoals
//
//  Created by Jonathan Kevin on 21/06/22.
//

import Foundation
import SwiftUI

//struct DatePickerTextField: UIViewRepresentable{
//
//    private let textField = UITextField()
//    private let datePicker = UIDatePicker()
//    private let helper = Helper()
//    private let dateFormatter: DateFormatter = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyy/MM/dd"
//
//        return dateFormatter
//    }
//
//    public var placeholder: String
//    @Binding public var date: Date?
//
//    func makeUIView(context: Context) -> UITextField {
//        self.datePicker.datePickerMode = .date
//        self.datePicker.preferredDatePickerStyle = .wheels
//        self.datePicker.addTarget(self.helper, action: #selector(self.helper.dateValueChanged), for: .valueChanged)
//        self.textField.placeholder = self.placeholder
//        self.textField.inputView = self.datePicker
//
//        self.helper.dateChanged = {
//            self.date = self.datePicker.date
//        }
//
//        return self.textField
//    }
//
//    func updateUIView(_ uiView: UITextField, context: Context) {
//        if let selectedDate = self.date{
//            uiView.text = self.dateFormatter.string(from: selectedDate)
//        }
//    }
//
//    func makeCoordinator() -> () {
//        Coordinator()
//    }
//
//    class Helper {
//
//        public var dateChanged: (() -> Void)?
//
//        @objc func dateValueChanged() {
//
//        }
//
//    }
//
//    class Coordinator {
//
//    }
//
//}
