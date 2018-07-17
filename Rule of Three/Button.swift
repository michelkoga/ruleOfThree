//
//  Button.swift
//  Rule of Three
//
//  Created by 古賀ミッシェル on 2018/07/17.
//  Copyright © 2018 古賀ミッシェル. All rights reserved.
//

import Cocoa

class Button: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
		self.focusRingType = .exterior
		self.isBordered = true
		self.showsBorderOnlyWhileMouseInside = true
		
    }
    
}
