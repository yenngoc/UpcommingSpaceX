//
//  Fairings.swift
//  DemoSpaceX
//
//  Created by Y on 11/09/2022.
//

import Foundation

struct Fairings: Decodable {
    var reused: Int?
    var recovery_attempt: String?
    var recovered: Bool?
    var ships: Array<String>?

    enum CodingKeys: String, CodingKey {
        case reused
        case recovery_attempt
        case recovered
        case ships
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        reused = try container.decode(Int.self, forKey: .reused)
        recovery_attempt = try container.decode(String.self, forKey: .recovery_attempt)
        recovered = try container.decode(Bool.self, forKey: .recovered)
        ships = try container.decode(Array<String>.self, forKey: .ships)
    }
}

