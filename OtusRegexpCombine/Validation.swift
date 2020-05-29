//
//  Validation.swift
//  OtusRegexpCombine
//
//  Created by Павел on 30.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation

class Validation {
    static func isPhoneValid(value: String, requered: Bool = false) -> Bool {
        if (value.isEmpty) {
          return !requered
        }
        
        let phoneRegex = "^((\\+7)|(8))[0-9]{10}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: value)
    }

    static func isEmailValid(value: String, requered: Bool = false) -> Bool {
        if (value.isEmpty) {
          return !requered
        }
        
        let emailRegex = "^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9._%+-]+\\.[a-zA-Z]{2,64})$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: value)
    }
    
    static func isFullNameValid(value: String, requered: Bool = false) -> Bool {
        if (value.isEmpty) {
          return !requered
        }
        
        let fullNameRegex = "^([a-zA-Zа-яА-Я]{1,64}\\s[a-zA-Zа-яА-Я]{1,64}\\s[a-zA-Zа-яА-Я]{1,64})$"
        return NSPredicate(format: "SELF MATCHES %@", fullNameRegex).evaluate(with: value)
    }

    static func isDateOfBirthValid(value: String, requered: Bool = false) -> Bool {
        if (value.isEmpty) {
          return !requered
        }
        
        let dateOfBirthRegex = "^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$"
        return NSPredicate(format: "SELF MATCHES %@", dateOfBirthRegex).evaluate(with: value)
    }

    
    static func isPasswordValid(value: String, requered: Bool = false) -> Bool {
        if (value.isEmpty) {
          return !requered
        }
        
        let passwordRegex = "^[a-zA-Z0-9!.+-_?#]{6,64}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: value)
    }
}
