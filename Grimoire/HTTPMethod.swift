//
//  HTTPMethod.swift
//  Grimoire
//
//  Created by Hesham Salman on 7/12/16.
//

import Foundation
import Alamofire

enum HTTPMethod {
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT

    var alamofireMethod: Alamofire.Method {
        switch self {
        case .OPTIONS:
            return Alamofire.Method.OPTIONS
        case .GET:
            return Alamofire.Method.GET
        case .HEAD:
            return Alamofire.Method.HEAD
        case .POST:
            return Alamofire.Method.POST
        case .PUT:
            return Alamofire.Method.PUT
        case .PATCH:
            return Alamofire.Method.PATCH
        case .DELETE:
            return Alamofire.Method.DELETE
        case .TRACE:
            return Alamofire.Method.TRACE
        case .CONNECT:
            return Alamofire.Method.CONNECT
        }
    }
}
