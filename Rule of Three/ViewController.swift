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
		NSEvent.addLocalMonitorForEvents(matching: .keyUp) {
			print("key up")
			return $0
		}
		
	}
	override func viewWillAppear() {
		view.window?.makeFirstResponder(firstIf)
		print("view will appear")
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
