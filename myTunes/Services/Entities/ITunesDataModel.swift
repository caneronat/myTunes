//
//  ITunesDataModel.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

// MARK: - ITunesDataModel
struct ITunesDataModel: Codable {
    let results: [Result]
}

struct Result: Codable {
    var artistName: String
    let trackName: String
    let artworkUrl100: String
    let trackId : Int
}
