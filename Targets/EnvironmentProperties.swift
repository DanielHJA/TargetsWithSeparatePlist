//
//  File.swift
//  Targets
//
//  Created by Daniel Hjärtström on 2020-04-17.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import Foundation

struct EnvironmentProperties: Decodable {
    
    var baseurl: String
    var apikey: String
 
    private enum CodingKeys: String, CodingKey {
        case baseurl = "baseurl"
        case apikey = "apikey"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        baseurl = try container.decode(String.self, forKey: .baseurl)
        apikey = try container.decode(String.self, forKey: .apikey)
    }
    
}
