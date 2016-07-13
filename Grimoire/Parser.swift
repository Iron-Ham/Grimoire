//
//  Parser.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation

protocol Parser {
    associatedtype T
    func parseToObject(dictionary: [NSObject: AnyObject]) -> T?
}
