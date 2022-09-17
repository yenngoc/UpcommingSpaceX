//
//  UpcomingSpaceXModel.swift
//  DemoSpaceX
//
//  Created by Y on 11/09/2022.
//

import Foundation

struct SpaceX: Decodable,Encodable {
//    var fairings: Fairings?
//    var links: Bool?
    var net: Bool?
    var rocket: String?
    var payloads: Array<String>?
    var launchpad: String?
    var flightNumber: Int?
    var name: String?
    var dateUtc: String?
    var dateUnix: Int?
    var dateLocal: String?
    var datePrecision: String?
    var launchLibId: String?
    var id: String?

    enum CodingKeys: String, CodingKey {
//        case fairings
        case  net
        case rocket
        case name
        case launchpad
        case flightNumber = "flight_number"
        case dateUtc = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case launchLibId = "launch_library_id"
        case id
    }
    
    
    static var getAllObjects: [SpaceX]? {
          if let objects = UserDefaults.standard.value(forKey: UserDefaults.Keys.spaceX) as? Data {
             let decoder = JSONDecoder()
             if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [SpaceX] {
                return objectsDecoded
             } else {
                return nil
             }
          } else {
             return nil
          }
       }

    static func saveAllObjects<T: Encodable>(allObjects: [T], objectKey: String) {
          let encoder = JSONEncoder()
        if objectKey == UserDefaults.Keys.spaceX {
            SUserDefaults.shared.removeObject(forKey: UserDefaults.Keys.spaceX)
            SUserDefaults.shared.synchronize()
        }
        if let encoded = try? encoder.encode(allObjects){
             UserDefaults.standard.set(encoded, forKey: UserDefaults.Keys.spaceX)
        }
     }
}


