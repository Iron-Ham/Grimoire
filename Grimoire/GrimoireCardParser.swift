//
//  GrimoireCardParser.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation

struct GrimoireCardParser: Parser {

    struct Keys {
        static let CardId = "cardId"
        static let CardName = "cardName"
        static let CardIntro = "cardIntro"
        static let CardIntroAttribution = "cardIntroAttribution"
        static let CardDescription = "cardDescription"
        static let UnlockText = "unlockHowToText"
        static let Rarity = "rarity"
        static let Points = "points"
        static let HighResolutionImage = "highResolution"
    }

    func parseToObject(dictionary: [NSObject : AnyObject]) -> GrimoireCard? {
        guard let cardId = dictionary[Keys.CardId] as? Int,
        let cardName = dictionary[Keys.CardName] as? String,
        let cardIntro = dictionary[Keys.CardIntro] as? String,
        let cardDescription = dictionary[Keys.CardDescription] as? String,
        let unlockText = dictionary[Keys.UnlockText] as? String,
        let rarity = dictionary[Keys.Rarity] as? Int,
        let points = dictionary[Keys.Points] as? Int,
        let highResolutionImageDictionary = dictionary[Keys.HighResolutionImage] as? [NSObject: AnyObject] else {
            return nil
        }

        let highResolutionImage = HighResolutionImageParser().parseToObject(highResolutionImageDictionary)

        let attributionString = dictionary[Keys.CardIntroAttribution] as? String

        return GrimoireCard(cardId: cardId,
                            cardName: cardName,
                            cardIntro: cleanString(cardIntro),
                            cardIntroAttribution: cleanString(attributionString ?? ""),
                            cardDescription: cleanString(cardDescription),
                            unlockHowToText: cleanString(unlockText),
                            rarity: rarity,
                            points: points,
                            highResolutionImage: highResolutionImage)
    }
}

func cleanString(string: String) -> String {
    return string.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
        .stringByReplacingOccurrencesOfString("&quot;", withString: "\"")
        .stringByReplacingOccurrencesOfString("&#39;", withString: "'")
}
