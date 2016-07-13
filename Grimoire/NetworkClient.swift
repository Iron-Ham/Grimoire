//
//  NetworkClient.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation

protocol NetworkClient {
    func performRequest(method: HTTPMethod, path: String, parameters: [String: AnyObject]?, callback: ((success: Bool, response: AnyObject?) -> Void)?)
    func fetchData(URL: NSURL, callback: (result: NetworkClientResult<NSData, NSError>) -> Void)
}

enum NetworkClientResult<Type, Error: ErrorType> {
    case Success(Type)
    case Failure(ErrorType)
}
