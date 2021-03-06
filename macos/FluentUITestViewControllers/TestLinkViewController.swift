//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import AppKit
import FluentUI

class TestLinkViewController: NSViewController {
	override func loadView() {
		let linkWithNoHover = Link(title: "Link", url: NSURL(string: "https://github.com/microsoft/fluentui-apple")!)
		
		let linkWithHover = Link(title: "Link with hover effects", url: NSURL(string: "https://github.com/microsoft/fluentui-apple")!)
		linkWithHover.showsUnderlineWhileMouseInside = true
		
		let linkWithHoverAndNoURL = Link(title: "Link with hover effects and no URL")
		linkWithHoverAndNoURL.showsUnderlineWhileMouseInside = true
		
		let linkWithOverridenTargetAction = Link(title: "Link with overridden Target/Action")
		linkWithOverridenTargetAction.showsUnderlineWhileMouseInside = true
		linkWithOverridenTargetAction.target = self
		linkWithOverridenTargetAction.action = #selector(displayAlert)
		
		let containerView = NSStackView(views: [linkWithNoHover, linkWithHover, linkWithHoverAndNoURL, linkWithOverridenTargetAction])
		containerView.edgeInsets = NSEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)
		containerView.orientation = .vertical
		containerView.distribution = .gravityAreas
		view = containerView
	}
	
	@objc private func displayAlert() {
		let alert = NSAlert()
		alert.messageText = "Alert"
		alert.informativeText = "This is an alert generated by a Link with an overridden Target/Action"
		alert.runModal()
	}
}
