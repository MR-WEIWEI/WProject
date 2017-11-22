//
//  RetrieveCodeModel.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/10/25.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class RetrieveCodeModel: BaseBean {

//    "codeTypeId":"142dc19e41ceaf44947a9ff48adcf2a26c6",
//    "codeType":"design_type",
//    "codeTypeName":"设计师作品类型",
//    "codeTypeDesc":"设计师作品类型：效果图，CAD设计图，VR全景图",
//    "codeTypeList":[
//    {
//    "codeValue":"dt_eff",
//    "codeValueDesc":"效果图"
//    },
    var codeTypeId = String()
    var codeType = String()
    var codeTypeName = String()
    var codeTypeDesc = String()
    var codeTypeList = Array<CodeTypeItemModel>()
}

class CodeTypeItemModel: BaseBean {
    
    var codeValue = String()
    var codeValueDesc = String()
}
