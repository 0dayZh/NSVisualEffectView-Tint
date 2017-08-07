//
//  AppDelegate.swift
//  Tinted Visual Effect View
//
//  Created by Boy van Amstel on 28/10/15.
//  Copyright © 2015 The Sync Factory. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet weak var window: NSWindow!
  @IBOutlet weak var vibrancyView: NSVisualEffectView!
  
  var tintColor: NSColor?
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application

    self.vibrancyView.material = .dark
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }
  
  func applyTint() {
   
    if let color = self.tintColor {
      print("Applying tint: \(self.tintColor)")
      // Tint the visual effect view
      for sublayer: CALayer in self.vibrancyView.layer!.sublayers! {
        if sublayer.name == "ClearCopyLayer" {
          sublayer.backgroundColor = color.cgColor
          break
        }
      }
    }
  }
 
  @IBAction func tintDark(_ sender: NSButton) {
    self.vibrancyView.material = .dark
    applyTint()
  }
  @IBAction func tintLight(_ sender: NSButton) {
    self.vibrancyView.material = .light
    applyTint()
  }
  
  @IBAction func tintRed(_ sender: NSButton) {
    self.tintColor = NSColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.1)
    applyTint()
  }
  @IBAction func tintBlue(_ sender: NSButton) {
    self.tintColor = NSColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.1)
    applyTint()
  }

}

