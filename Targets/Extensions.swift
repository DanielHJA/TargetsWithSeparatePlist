//
//  Extensions.swift
//  Targets
//
//  Created by Daniel Hjärtström on 2020-04-17.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import Foundation
import UIKit

enum Environment {
    case debug
    case release
}

extension UIApplication {
    
    static func fetchEnvironmentProperties(_ bundle: Bundle = Bundle.main) -> EnvironmentProperties? {
        let propertyListName: String = environmentPropertyListName()
        guard let path = bundle.path(forResource: propertyListName, ofType: Constants.Filetypes.plist) else { return nil }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let properties: EnvironmentProperties? = data.decodePropertyList()
            return properties
        } catch {
            print(error)
        }
        return nil
    }
    
    static func environmentPropertyListName() -> String {
        switch environment {
        case .debug:
            return Constants.PropertyLists.debug
        case .release:
            return Constants.PropertyLists.production
        }
    }
    
    static func log(_ object: Any?) {
        if case environment = Environment.debug {
            print(object)
        }
    }
    
    static var environment: Environment {
        #if DEBUG
            return .debug
        #else
            return .release
        #endif
    }
    
}

extension Data {
    
    func decode<T: Decodable>() -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: self)
        } catch {
            print(error)
        }
        return nil
    }
    
    func decodePropertyList<T: Decodable>() -> T? {
        let decoder = PropertyListDecoder()
        do {
            return try decoder.decode(T.self, from: self)
        } catch {
            print(error)
        }
        return nil
    }
    
}


