//
//  HomeEntities.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

struct HomeEntryEntity {
}

class HomeEntities {
    var entryEntity: HomeEntryEntity
    var source: HomeCollectionViewSource?
    
    init(entryEntity: HomeEntryEntity) {
        self.entryEntity = entryEntity
    }
}
