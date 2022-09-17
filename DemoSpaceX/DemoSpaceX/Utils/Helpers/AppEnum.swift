//
//  AppEnum.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation

enum Certificate: String {
    case R = "R"
    case G = "G"
    case PG = "PG"
    case X = "X"
}

enum ApiSort: String {
    case ReleaseDateASC = "release_date.asc"
    case RelleaseDateDESC = "release_date.desc"
    case PopularityASC = "popularity.asc"
    case PopularityDESC = "popularity.desc"
}
