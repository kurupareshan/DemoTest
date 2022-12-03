//
//  Employees.swift
//  MVVM_Combine_Test
//
//  Created by kurupareshan pathmanathan on 11/25/22.
//

import Foundation

struct Employees: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let url, reposURL, eventsURL, hooksURL: String
    let issuesURL: String
    let membersURL, publicMembersURL: String
    let avatarURL: String
    let welcomeDescription: String?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case url
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case hooksURL = "hooks_url"
        case issuesURL = "issues_url"
        case membersURL = "members_url"
        case publicMembersURL = "public_members_url"
        case avatarURL = "avatar_url"
        case welcomeDescription = "description"
    }
}

typealias EmployeesData = [Employees]
