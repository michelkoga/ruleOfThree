//
//  ViewController.swift
//  Rule of Three
//
//  Created by 古賀ミッシェル on 2018/07/17.
//  Copyright © 2018 古賀ミッシェル. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
	enum rule {
		case direct
		case inverse
	}
	// Variables:
	var currentRule = rule.direct
	
	@IBOutlet weak var ruleButton: NSButton!
	
	@IBOutlet weak var firstIf: NSTextField!
	@IBOutlet weak var firstIs: NSTextField!
	@IBOutlet weak var secondIf: NSTextField!
	@IBOutlet weak var secondIs: NSTextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
			switch $0.keyCode {
			case 18...23, 25, 26, 28, 29, 47, 48, 36, 51, 65, 82...92:
				return $0
			default:
				return nil
			}
		}
		
	}
	override func keyUp(with event: NSEvent) {
		calculate()
	}
	func calculate() {
		
	}
	override func viewWillAppear() {
		view.window?.makeFirstResponder(firstIf)
	}
	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}
	func textFieldValDidCheng(_ textField: NSTextField) {
		//let formatter = NSNumberFormatter
		//formatter.numberStyle = NumberFormatter.Style.decimal
		
	}
	@IBAction func changeRule(_ sender: Any) {
		if currentRule == .direct {
			currentRule = .inverse
			ruleButton.image = NSImage(named: NSImage.Name(rawValue: "inverse"))
		} else {
			currentRule = .direct
			ruleButton.image = NSImage(named: NSImage.Name(rawValue: "direct"))
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

