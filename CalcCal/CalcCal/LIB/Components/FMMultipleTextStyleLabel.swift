//
//  FMMultipleTextStyleLabel.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

final class FMMultipleTextStyleLabel: UILabel {
    
    //MARK: - Constructor
    
    init(texts: [(text: String, style: [NSAttributedString.Key: Any])] = []) {
        super.init(frame: .zero)
        
        let attributedText = NSMutableAttributedString.init()
        texts.forEach { (text, atributed) in
            attributedText.append(NSAttributedString(
                string: text,
                attributes: atributed
            ))
        }
        
        self.attributedText = attributedText
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        isUserInteractionEnabled = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func makeTwoDiferentStyleInText(partOne: String, partTwo: String) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(
            string: partOne,
            attributes: [
                .font: UIFont.systemFont(ofSize: 17),
                .foregroundColor: UIColor.black
            ]
        )
        
        attributedText.append(NSAttributedString(
            string: partTwo,
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 17),
                .foregroundColor: UIColor.red
            ]
        ))
        
        return attributedText
    }
    
}
