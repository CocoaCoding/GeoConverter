//
//  NumericOnlyInputFormatter.swift
//
//  Updated to Swift 4 by Holger Hinzberg on 2018-05-03
//  Copyright (c) 2018 Holger Hinzberg. All rights reserved.
//

import Foundation

class NumericOnlyInputFormatter: Formatter
{
    override func string(for obj: Any?) -> String?
    {
        if let stringValue = obj as? String
        {
            return stringValue
        }
        return nil
    }
    
    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool
    {
        obj?.pointee = string as AnyObject
        return true
    }
    
    override func isPartialStringValid(_ partialStringPtr: AutoreleasingUnsafeMutablePointer<NSString>, proposedSelectedRange proposedSelRangePtr: NSRangePointer?, originalString origString: String, originalSelectedRange origSelRange: NSRange, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool
    {
        let aRange = NSMakeRange(origSelRange.location, (proposedSelRangePtr?.pointee.location)! - origSelRange.location)
        let partialString = partialStringPtr.pointee.substring(with: aRange)
        let nonNumbers = NSCharacterSet.decimalDigits.inverted
        
        if partialString.rangeOfCharacter(from: nonNumbers) != nil
        {
            return false
        }
        return true
    }
}
