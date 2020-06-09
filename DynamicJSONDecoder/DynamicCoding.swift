//
//  DynamicCoding.swift
//  DynamicJSONDecoder
//
//  Created by 韦儒健 on 2020/6/9.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import Foundation

struct DynamicCoding<T: Codable>: Codable {
    var array: [T]
    private struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var tempArray = [T]()
        for key in container.allKeys {
            let object = try container.decode(T.self,
                                              forKey: DynamicCodingKeys(stringValue: key.stringValue))
            tempArray.append(object)
        }
        self.array = tempArray
    }
}
