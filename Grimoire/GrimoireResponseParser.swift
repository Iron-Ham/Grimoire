//
//  GrimoireResponseParser.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation

struct GrimoireResponseParser: Parser {

    struct Keys {
        static let Response = "Response"
        static let ThemeCollection = "themeCollection"
        static let PageCollection = "pageCollection"
    }

    let grimoirePageParser = GrimoirePageParser()

    func parseToObject(dictionary: [NSObject : AnyObject]) -> [GrimoirePage]? {
        guard let response = dictionary[Keys.Response] as? [NSObject: AnyObject],
        let themeCollection = response[Keys.ThemeCollection] as? [[NSObject: AnyObject]] else {
            return nil
        }

        var pages = [GrimoirePage]()

        for page in themeCollection {
            let pageCollection = page[Keys.PageCollection] as! [[NSObject: AnyObject]]
            let mapping = pageCollection.flatMap { self.grimoirePageParser.parseToObject($0) }
            pages.appendContentsOf(mapping)

        }

        return pages
    }
}
