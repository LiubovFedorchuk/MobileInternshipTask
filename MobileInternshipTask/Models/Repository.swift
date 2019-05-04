//
//  Repository.swift
//  MobileInternshipTask
//
//  Created by Liubov Fedorchuk on 5/4/19.
//  Copyright © 2019 Liubov Fedorchuk. All rights reserved.
//

import Foundation

/**
    # Model
 
    Model Repository inherited public protocol Decodable:
    - for mapping object Repository from JSON format.
 
    Created using [GitHUb API: Repository]
 
    [GitHub API: Repository]: https://developer.github.com/v3/repos
 
 */

struct Repository: Decodable {
    var name: String
    var description: String?
    var url: String?
    var openIssuesCount: Int?
    var watchersCount: Int?
    var forksCount: Int?
    var stargazersCount: Int?
    var size: Int?
    var createdAt: String?
    var updatedAt: String?
    var defaultBranch: String?
    var language: String?

    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case url = "html_url"
        case openIssuesCount = "open_issues"
        case watchersCount = "watchers"
        case forksCount = "forks_count"
        case stargazersCount = "stargazers_count"
        case size
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case defaultBranch = "default_branch"
        case language
    }
}

