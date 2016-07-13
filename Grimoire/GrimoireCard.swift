//
//  GrimoireCard.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation

struct GrimoireCard {
    let cardId: Int
    let cardName: String
    let cardIntro: String
    let cardIntroAttribution: String
    let cardDescription: String
    let unlockHowToText: String
    let rarity: Int
    let points: Int
    let highResolutionImage: HighResolutionImage?
}
