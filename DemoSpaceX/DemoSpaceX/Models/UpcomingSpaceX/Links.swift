//
//  Links.swift
//  DemoSpaceX
//
//  Created by Y on 11/09/2022.
//

import Foundation
/*"cores": [
 {
 "core": "5fe3b8f2b3467846b3242181",
 "flight": 1,
 "gridfins": true,
 "legs": true,
 "reused": false,
 "landing_attempt": null,
 "landing_success": null,
 "landing_type": null,
 "landpad": null
 
 */
struct Links: Decodable {
    var patch: Patch?
    var reddit: Reddit?
    var presskit: String?
    var article: String?
    
    enum CodingKeys: String, CodingKey {
        case patch
        case reddit
        case presskit
        case article
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        patch = try container.decode(Patch.self, forKey: .patch)
        reddit = try container.decode(Reddit.self, forKey: .reddit)
        presskit = try container.decode(String.self, forKey: .presskit)
        article = try container.decode(String.self, forKey: .article)
    }
}

struct Patch: Decodable {
    var small: String?
    var large: String?
    
    
    enum CodingKeys: String, CodingKey {
        case small
        case large
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        small = try container.decode(String.self, forKey: .small)
        large = try container.decode(String.self, forKey: .large)
    }
}

struct Reddit: Decodable {
    var campaign: String?
    var launch: String?
    var media: String?
    var recovery: String?
    
    
    enum CodingKeys: String, CodingKey {
        case campaign
        case launch
        case media
        case recovery
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        campaign = try container.decode(String.self, forKey: .campaign)
        launch = try container.decode(String.self, forKey: .launch)
        media = try container.decode(String.self, forKey: .media)
        recovery = try container.decode(String.self, forKey: .recovery)
    }
}


