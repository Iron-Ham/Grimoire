//
//  APIClient.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation
import Alamofire

public struct APIClient: NetworkClient {

    static var basePath = "https://www.bungie.net"
    var headers: [String: String] {
        return ["X-API-Key": "36a8feac635849769b23ce9cd0e6e946"]
    }

    func performRequest(method: HTTPMethod, path: String, parameters: [String: AnyObject]?, callback: ((success: Bool, response: AnyObject?) -> Void)?) {
        let relativePath = APIClient.basePath + path

        Alamofire.request(method.alamofireMethod, relativePath, parameters: parameters, headers: headers).responseJSON { (response) in
            switch response.result {
            case .Success(let value):
                callback?(success: true, response: value)
            case .Failure(let error):
                callback?(success: false, response: error.userInfo)
            }
        }
    }

    func fetchData(URL: NSURL, callback: (result: NetworkClientResult<NSData, NSError>) -> Void) {
        Alamofire.request(.GET, URL).responseData { (response) in
            switch response.result {
            case .Success(let data):
                callback(result: .Success(data))
            case .Failure(let error):
                callback(result: .Failure(error))
            }
        }
    }
}
