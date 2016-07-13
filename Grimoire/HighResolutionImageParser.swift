//
//  HighResolutionImageParser.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation

struct HighResolutionImageParser: Parser {
    struct Keys {
        static let Image = "image"
        static let SheetPath = "sheetPath"
    }

    func parseToObject(dictionary: [NSObject : AnyObject]) -> HighResolutionImage? {
        guard let image = dictionary[Keys.Image] as? [NSObject: AnyObject],
            let sheetPath = image[Keys.SheetPath] as? String else {
            return nil
        }

        return HighResolutionImage(path: sheetPath)
    }
}
