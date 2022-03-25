//
//  YoutubeSearchResponse.swift
//  NetflixCloneAppMVVM
//
//  Created by Américo MQ on 24/03/22.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
