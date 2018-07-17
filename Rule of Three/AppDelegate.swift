//
//  AppDelegate.swift
//  Rule of Three
//
//  Created by 古賀ミッシェル on 2018/07/17.
//  Copyright © 2018 古賀ミッシェル. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
	let popover = NSPopover()
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		if let button = statusItem.button {
			NSEvent.addGlobalMonitorForEvents(matching: .leftMouseDown) {_ in
				self.popover.close()
			}
			button.image = NSImage(named: NSImage.Name(rawValue: "ruleOfThree"))
			button.action = #selector(showApp(_:))
		}
		popover.contentViewController = ViewController.freshController()
	}
	@objc func showApp(_ sender: Any?) {
		if popover.isShown {
			closePopover(sender: sender)
		} else {
			showPopover(sender: sender)
		}
	}
	
	func showPopover(sender: Any?) {
		if let button = statusItem.button {
			popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
		}
	}
	
	func closePopover(sender: Any?) {
		popover.performClose(sender)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}

