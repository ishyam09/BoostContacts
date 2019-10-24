//
//  Global.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

class Global {
    
    // to avoid multiple instance
    static let shared = {
        return Global()
    }()
    
    static let dataFactory = DataFactory.shared
    
    // MARK: - Generate random alphanumeric string by given length
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    // MARK: - Format Phone Number according to requirement
    func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "(XXX) XXX-XXXX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
    
    //MARK:- Copy file from bundle resource to documents folder inside app
    func copyFileToDocumentsFolder(nameForFile: String, extForFile: String) {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destURL = documentsURL!.appendingPathComponent(nameForFile).appendingPathExtension(extForFile)
        
        guard let sourceURL = Bundle.main.url(forResource: nameForFile, withExtension: extForFile) else {
                print("Source File not found.")
            
                return
        }
        
        let fileManager = FileManager.default
        
        do {
            try fileManager.copyItem(at: sourceURL, to: destURL)
        } catch {
            print("Unable to copy file")
        }
    }
    
}
