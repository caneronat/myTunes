//
//  DetailEntities.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

struct DetailEntryEntity {
    var detail:Result
}

class DetailEntities {
    var entryEntity: DetailEntryEntity
    
    init(entryEntity: DetailEntryEntity) {
        self.entryEntity = entryEntity
    }
}
