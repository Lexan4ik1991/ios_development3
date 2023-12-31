//
//  GroupModel.swift
//  HWNetwork
//
//  Created by Алексей on 21.08.2023.
//

struct GroupsModel: Decodable {
    var response: Groups?
}

struct Groups: Decodable {
    var items: [Group]?
}

struct Group: Codable {
    var id: Int
    var name: String?
    var description: String?
    var photo: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case photo = "photo_50"
    }
}
