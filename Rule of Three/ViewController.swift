//
//  ViewController.swift
//  Rule of Three
//
//  Created by 古賀ミッシェル on 2018/07/17.
//  Copyright © 2018 古賀ミッシェル. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {
	enum rule {
		case direct
		case inverse
	}
	// Variables:
	var currentRule = rule.direct
	var currentFraction = 2
	
	@IBOutlet weak var ruleButton: NSButton!
	@IBOutlet weak var ruleButton2: NSButton!
	
	@IBOutlet weak var firstIf: NSTextField!
	@IBOutlet weak var firstIs: NSTextField!
	@IBOutlet weak var secondIf: NSTextField!
	@IBOutlet weak var secondIs: NSTextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		firstIf.delegate = self
		firstIs.delegate = self
		secondIf.delegate = self
		
		NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
			switch $0.keyCode {
			case 18...23, 25, 26, 28, 29, 47, 48, 36, 51, 65, 82...92:
				return $0
			default:
				return nil
			}
		}
		
	}
	override func controlTextDidChange(_ obj: Notification) {
		calculate()
	}
	func calculate() {
		switch currentRule {
		case .direct:
			calculateDirect()
		case .inverse:
			calculateInverse()
		}
	}
	func calculateDirect() {
		let a = Double(firstIf.stringValue.replacingOccurrences(of: ",", with: ""))
		let b = Double(firstIs.stringValue.replacingOccurrences(of: ",", with: ""))
		let c = Double(secondIf.stringValue.replacingOccurrences(of: ",", with: ""))
		
		if (a == nil) { return }
		if (b == nil) { return }
		if (c == nil) { return }
		
		let result = b! * c! / a!
		
		secondIs.doubleValue = result.rounded(toPlaces: currentFraction)
		
	}
	func calculateInverse() {
		let a = Double(firstIf.stringValue.replacingOccurrences(of: ",", with: ""))
		let b = Double(firstIs.stringValue.replacingOccurrences(of: ",", with: ""))
		let c = Double(secondIf.stringValue.replacingOccurrences(of: ",", with: ""))
		
		if (a == nil) { return }
		if (b == nil) { return }
		if (c == nil) { return }
		
		let result = b! * a! / c!
		
		secondIs.doubleValue = result.rounded(toPlaces: currentFraction)
	}
	override func viewWillAppear() {
		view.window?.makeFirstResponder(firstIf)
	}
	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}
	@IBAction func changeRule(_ sender: Any) {
		if currentRule == .direct {
			currentRule = .inverse
			ruleButton.image = NSImage(named: NSImage.Name(rawValue: "inverse"))
			ruleButton2.title = "Direct"
			calculateInverse()
		} else {
			currentRule = .direct
			ruleButton.image = NSImage(named: NSImage.Name(rawValue: "direct"))
			ruleButton2.title = "Inverse"
			calculateDirect()
		}
	}
	@IBAction func reset(_ sender: Any) {
		firstIs.stringValue = ""
		firstIf.stringValue = ""
		secondIf.stringValue = ""
		secondIs.stringValue = ""
	}
	@IBAction func copy(_ sender: Any) {
		let string = secondIs.stringValue
		writeToPasteboard(pasteboard: NSPasteboard.general, string: string)
	}
	@IBAction func quit(_ sender: Any) {
		NSApplication.shared.terminate(self)
	}
	@IBAction func setFraction(_ sender: NSPopUpButtonCell) {
		currentFraction = sender.indexOfSelectedItem
		calculate()
	}
	func writeToPasteboard(pasteboard: NSPasteboard, string: String) {
		if string != "" {
			pasteboard.clearContents()
			pasteboard.writeObjects([string as NSPasteboardWriting])
		}
	}
}

extension ViewController {
	// MARK: Storyboard instantiation
	static func freshController() -> ViewController {
		//1.
		let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
		//2.
		let identifier = NSStoryboard.SceneIdentifier(rawValue: "ViewController")
		//3.
		guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? ViewController else {
			fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
		}
		return viewcontroller
	}
}
extension Double {
	/// Rounds the double to decimal places value
	func rounded(toPlaces places:Int) -> Double {
		let divisor = pow(10.0, Double(places))
		return (self * divisor).rounded() / divisor
	}
}

