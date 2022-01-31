//
//  FMTextStyleFormatters.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

final class FMTextStylesFormatters {
    
    static func makeTwoDiferentStyleInText(partOne: String, partTwo: String) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(
            string: partOne, attributes: [.font: UIFont.systemFont(ofSize: 17),
                                          .foregroundColor: UIColor.black]
        )
        
        attributedText.append(NSAttributedString(
            string: partTwo, attributes: [.font: UIFont.boldSystemFont(ofSize: 17),
                                          .foregroundColor: UIColor.red]
        ))
        
        return attributedText
    }
    
    static func underlinePropertieGetter(_ text: String) -> NSAttributedString {
        return NSMutableAttributedString(
            string: text,
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
    }
    
}
