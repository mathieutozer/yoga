//
//  ViewController.swift
//  YogaKitSampleMacOS
//
//  Created by Mathieu Tozer on 4/11/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

import Cocoa
import YogaKit

class BackgroundView: NSView {
  var backgroundColor: NSColor = .white

  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    backgroundColor.set()
    NSRectFill(dirtyRect)
  }
}

class ViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let containerSize = self.view.bounds.size

    let root = self.view
    root.configureLayout { (layout) in
      layout.isEnabled = true
      layout.width = containerSize.width
      layout.height = containerSize.height
      layout.alignItems = .center
      layout.justifyContent = .center
    }

    let child1 = BackgroundView()
    child1.backgroundColor = .blue
    child1.configureLayout { (layout) in
      layout.isEnabled = true
      layout.width = 100
      layout.height = 10
      layout.marginBottom = 25
    }
    root.addSubview(child1)

    let child2 = BackgroundView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    child2.backgroundColor = .green
    child2.configureLayout { (layout) in
      layout.isEnabled = true
      layout.alignSelf = .flexEnd
    }
    root.addSubview(child2)

    let child3 = BackgroundView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    child3.backgroundColor = .yellow
    child3.configureLayout { (layout) in
      layout.isEnabled = true
      layout.alignSelf = .flexStart
    }
    root.addSubview(child3)

    root.yoga.applyLayout(preservingOrigin: true)
  }

}

