//
//  PreferencesViewController.swift
//  Rule of Three
//
//  Created by 古賀ミッシェル on 2018/07/25.
//  Copyright © 2018 古賀ミッシェル. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {
	@IBOutlet weak var styleButton: NSPopUpButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		let selectedStyle = UserDefaults.standard.string(forKey: "Style")
		styleButton.selectItem(withTitle: selectedStyle ?? "None")
    }
	@IBAction func setStyle(_ sender: NSPopUpButton) {
		switch sender.titleOfSelectedItem {
		case "None":
			UserDefaults.standard.set("None", forKey: "Style")
		case "Dots":
			UserDefaults.standard.set("Dots", forKey: "Style")
		case "Commas":
			UserDefaults.standard.set("Commas", forKey: "Style")
		default:
			print("Default")
		}
		print(UserDefaults.standard.string(forKey: "Style") ?? "None")
	}
	@IBAction func okButton(_ sender: NSButton) {
		let vcStores = self.storyboard?.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("ViewController"))
			as! NSViewController
		self.view.window?.contentViewController = vcStores
	}
	
}
