//
//  ImageInfo.swift
//  Assignment3
//
//  Created by user199511 on 11/9/21.
//

import Foundation

class ImageInfo {
    var name:String = ""
    var ImageURL = URL(string: "https://images.freeimages.com/images/small-previews/39a/champagne-with-citron-1325320.jpg")!
    init(n: String, url: URL)
    {
        name=n
        ImageURL=url
    }
}
