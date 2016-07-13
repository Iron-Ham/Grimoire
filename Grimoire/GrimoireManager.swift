//
//  GrimoireManager.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation

struct GrimoireManager {

    let relativePath = "/platform/destiny/Vanguard/Grimoire/Definition/"

    let client: NetworkClient

    let responseParser: GrimoireResponseParser = GrimoireResponseParser()

    init(client: NetworkClient = APIClient()) {
        self.client = client
    }

    func fetchGrimoireCards(callback: (success: Bool, grimoirePages: [GrimoirePage]?) -> Void) {
        client.performRequest(.GET, path: relativePath, parameters: nil) { (success, response) in
            if let response = response as? [NSObject: AnyObject] where success,
                let grimoirePages = self.responseParser.parseToObject(response) {
                callback(success: success, grimoirePages: grimoirePages)
            } else {
                callback(success: success, grimoirePages: nil)
            }
        }
    }

}
