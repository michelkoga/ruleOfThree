//
//  TextField.swift
//  Rule of Three
//
//  Created by 古賀ミッシェル on 2018/07/17.
//  Copyright © 2018 古賀ミッシェル. All rights reserved.
//

import Cocoa

class TextField: NSTextField {
	
	override func draw(_ dirtyRect: NSRect) {
		super.draw(dirtyRect)
		self.focusRingType = .none
		self.usesSingleLineMode = true
		let border = CALayer()
		let width = CGFloat(1.0)
		border.borderColor = NSColor.lightGray.cgColor
		border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
		
		border.borderWidth = width
		self.layer?.addSublayer(border)
		self.layer?.masksToBounds = true
		self.backgroundColor = NSColor.clear
		if self.stringValue.count > 0 {
			switch UserDefaults.standard.string(forKey: "Style") {
			case "None":
				let string = self.stringValue.convertToNoneStyle
				self.stringValue = string
			case "Dots":
				let string = self.stringValue.convertToDotDecimalStyle
				self.stringValue = string
			case "Commas":
				let string = self.stringValue.convertToCommaDecimalStyle
				self.stringValue = string
			default:
				break
			}
		}
		
		/*if self.stringValue.first == "." {
			self.stringValue.insert("0", at: self.stringValue.startIndex)
		}*/
		
		//self.stringValue = self.stringValue.replacingOccurrences(of: ",", with: "")
//		let decimalNumber = Double(self.stringValue)
//		let numberFormatter = NumberFormatter()
//		numberFormatter.numberStyle = .decimal
//		numberFormatter.usesGroupingSeparator = true
//		numberFormatter.generatesDecimalNumbers = true
//		numberFormatter.groupingSeparator = ","
//		numberFormatter.decimalSeparator = "."
//		numberFormatter.multiplier = 1
//		numberFormatter.minimumFractionDigits = 0
//		numberFormatter.maximumFractionDigits = 5
//		if decimalNumber != nil {
//			let formattedNumber = numberFormatter.string(from: NSNumber(value: decimalNumber!))
//			let result = String(formattedNumber!)
//			print(result)
//			self.stringValue = result
//		}
	}
	
}
