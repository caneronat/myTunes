//
//  ITunesDataModel.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

struct ITunesDataModel: Codable {
    let results: [results]
}

struct results: Codable {
    var artistName: String
    let trackName: String
    let artworkUrl100: String
    let trackId : Int
}
