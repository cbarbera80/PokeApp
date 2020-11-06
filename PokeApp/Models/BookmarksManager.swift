//
//  BookmarksManager.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import Foundation

class BookmarkManager {
    
    private var data: Set<Pokemon>

    init() {
        self.data = Set(UserDefaultsConfig.bookmarks ?? [])
    }

    func contains(_ object: Pokemon) -> Bool {
        data.contains(object)
    }
    
    func add(_ object: Pokemon) {
        data.insert(object)
        save()
    }

    func remove(_ object: Pokemon) {
        data.remove(object)
        save()
    }

    func save() {
        UserDefaultsConfig.bookmarks = Array(data)
    }
    
    var bookmarks: [Pokemon] {
        return Array(data)
    }
}
