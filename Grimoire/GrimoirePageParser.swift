//
//  GrimoirePageParser.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation

struct GrimoirePageParser: Parser {

    struct Keys {
        static let PageID = "pageId"
        static let PageName = "pageName"
        static let HighResolutionImage = "highResolution"
        static let CardCollection = "cardCollection"
    }

    let cardParser = GrimoireCardParser()

    func parseToObject(dictionary: [NSObject : AnyObject]) -> GrimoirePage? {
        guard let pageId = dictionary[Keys.PageID] as? String,
            let pageName = dictionary[Keys.PageName] as? String,
            let highResolutionImageDictionary = dictionary[Keys.HighResolutionImage] as? [NSObject: AnyObject],
            let cardCollectionDictionary = dictionary[Keys.CardCollection] as? [[NSObject: AnyObject]] else {
                return nil
        }

        let cardCollection = cardCollectionDictionary.flatMap { cardParser.parseToObject($0) }
        let image = HighResolutionImageParser().parseToObject(highResolutionImageDictionary)

        return GrimoirePage(pageId: cleanString(pageId), pageName: cleanString(pageName), highResolutionImage: image, grimoireCards: cardCollection)
    }
}
