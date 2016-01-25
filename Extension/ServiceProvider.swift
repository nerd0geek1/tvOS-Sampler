//
//  ServiceProvider.swift
//  Extension
//
//  Created by Kohei Tabata on 2016/01/25.
//  Copyright © 2016年 Kohei Tabata. All rights reserved.
//

import Foundation
import TVServices

class ServiceProvider: NSObject, TVTopShelfProvider {

    override init() {
        super.init()
    }

    // MARK: - TVTopShelfProvider protocol

    var topShelfStyle: TVTopShelfContentStyle {
        // Return desired Top Shelf style.
        return .Sectioned
    }

    var topShelfItems: [TVContentItem] {
        // Create an array of TVContentItems.
        return sampleShelfItems()
    }

    private func sampleShelfItems() -> [TVContentItem] {
        guard let contentIdentifier: TVContentIdentifier = TVContentIdentifier(identifier: "foo", container: nil) else { return [] }
        guard let contentItem: TVContentItem = TVContentItem(contentIdentifier: contentIdentifier) else { return [] }

        contentItem.title = "bar"
        let mainBundle = NSBundle.mainBundle()
        guard let imageURL = mainBundle.URLForResource("blue", withExtension: "jpg") else { fatalError("Error determining local image URL.") }

        contentItem.imageURL = imageURL
        contentItem.displayURL = NSURL(string: "tvossampler://")
        contentItem.imageShape = .Square

        //Set this if you use Sectioned style
        contentItem.topShelfItems = [contentItem]

        return [contentItem]
    }
}
