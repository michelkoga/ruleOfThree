//
//  Converter.swift
//  Rule of Three
//
//  Created by 古賀ミッシェル on 2018/07/25.
//  Copyright © 2018 古賀ミッシェル. All rights reserved.
//

import Foundation

//struct Converter {
//	static func convertToDecimalStyle(string: String) -> String {
//		let string = string.removeCommas
//		if string.containFraction {
//			let array = string.splitFraction
//			let integer = String(array[0])
//			let fraction = String(array[1])
//			let result = integer.convertToDecimalStyle + "." + fraction
//			return result
//		}
//		let result = string.convertToDecimalStyle
//
//		return result
//	}
//}
class Preferences {
	enum style {
		case comma
		case dot
	}
	var currentStyle = style.comma
	
}
extension String {
	var convertToNoneStyle: String {
		if self.numberOfDots > 2 {
			return String(self.dropLast())
		} else {
			return self
		}
	}
	
	var convertToCommaDecimalStyle: String {
		if self.numberOfDots > 2 {
			return String(self.dropLast())
		}
		let string = self.removeCommas
		if string.containDotFraction {
			if string.last == "." {
				let integer = String(string.dropLast())
				let result = integer.insertDecimalCommas + "."
				return result
			} else {
				let array = string.splitDotFraction
				let integer = String(array[0])
				let fraction = String(array[1])
				let result = integer.insertDecimalCommas + "." + fraction
				return result
			}
		}
		let result = string.insertDecimalCommas
		
		return result
	}
	var convertToDotDecimalStyle: String {
		var string = ""
		if self.last == "." {
			if self.containCommaFraction {
				string = self.removeDots
			} else {
				string = self.removeDots + ","
				if string.numberOfCommas > 2 {
					string = String(string.dropLast())
				}
			}
		} else {
			string = self.removeDots
		}
		if string.containCommaFraction {
			if string.last == "," {
				let integer = String(string.dropLast())
				let result = integer.insertDecimalDots + ","
				return result
			} else {
				let array = string.splitCommaFraction
				let integer = String(array[0])
				let fraction = String(array[1])
				let result = integer.insertDecimalDots + "," + fraction
				return result
			}
		}
		let result = string.insertDecimalDots
		
		return result
	}
	private var containDotFraction: Bool {
		
		if self.contains(".") {
			return true
		} else {
			return false
		}
	}
	private var containCommaFraction: Bool {
		
		if self.contains(",") {
			return true
		} else {
			return false
		}
	}
	private var splitDotFraction: Array<Substring> {
		let result = self.split(separator: ".")
		return result
	}
	private var splitCommaFraction: Array<Substring> {
		let result = self.split(separator: ",")
		return result
	}
	private var removeCommas: String {
		return self.remove(string: ",")
	}
	private var removeDots: String {
		return self.replacingOccurrences(of: ".", with: "")
	}
	func remove(string: String) -> String {
		let result = self.replacingOccurrences(of: string, with: "")
		return result
	}
	private var insertDecimalCommas: String {
		var count = 3
		var string = self
		var reversedString = String(string.reversed())
		while count < reversedString.count {
			let index = reversedString.index(reversedString.startIndex, offsetBy: count)
			reversedString.insert(",", at: index)
			count += 4
		}
		string = String(reversedString.reversed())
		return string
	}
	private var insertDecimalDots: String {
		var count = 3
		var string = self
		var reversedString = String(string.reversed())
		while count < reversedString.count {
			let index = reversedString.index(reversedString.startIndex, offsetBy: count)
			reversedString.insert(".", at: index)
			count += 4
		}
		string = String(reversedString.reversed())
		return string
	}
	private var numberOfDots: Int {
		let string = self.components(separatedBy: ".")
		return string.count
	}
	private var numberOfCommas: Int {
		let string = self.components(separatedBy: ",")
		return string.count
	}
}
