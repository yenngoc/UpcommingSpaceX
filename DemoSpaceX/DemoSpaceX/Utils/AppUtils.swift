//
//  AppUtils.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation
import UIKit


class AppUtils {
    class func image(from urlString: String, imageSizeWidth: Int? = nil) -> String {
        var size = "original"
        if let width = imageSizeWidth {
            if width % 100 == 0 {
                size = "w\(width)"
            } else {
                debugPrint("tmdb is not support size for this width")
            }
        }
        return "https://image.tmdb.org/t/p/\(size)\(urlString)"
    }
    
    class func generateGenre(from ids:[Int], genres: [Int: String]) -> String {
        var genreArray: [String?] = []
        for genreId in ids {
            genreArray.append(genres[genreId])
        }
        return genreArray.compactMap{ return $0 }.joined(separator: " | ")
    }
}
