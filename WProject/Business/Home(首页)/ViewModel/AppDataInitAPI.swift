//
//  AppDataInitApi.swift
//  XianMuShu
//
//  Created by pandaApe on 24/10/2017.
//  Copyright © 2017 pandaApe. All rights reserved.
//

import Foundation
import Moya

enum AppDataInitAPI {
    case retrieveCodeList
    case retrieveParamList
    case test(param: [String: Any])
}

extension AppDataInitAPI: TargetType {
    
    public var path: String {
        switch self {
        case .retrieveCodeList:
            return "gxgjapi/retrieveCodeTable.do"
        case .retrieveParamList:
            return "gxgjapi/retrieveParameterTable.do"
        case .test:
            return ""
        }
    }

    public var task: Task {
        switch self {
            
        case .retrieveCodeList,.retrieveParamList:
            return .requestParameters(parameters: ["":""], encoding: JSONEncoding.default)
            
        case .test(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        }
    }
  
}
