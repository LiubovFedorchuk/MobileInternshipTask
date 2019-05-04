//
//  DetailsViewController.swift
//  MobileInternshipTask
//
//  Created by Liubov Fedorchuk on 5/4/19.
//  Copyright © 2019 Liubov Fedorchuk. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var watcherCountLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var forkCountLabel: UILabel!
    @IBOutlet weak var defaultBranchLabel: UILabel!
    @IBOutlet weak var openIssuesLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var updateDateLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    var name: String?
    var descriptionRepository: String?
    var watcherCount: Int?
    var starCount: Int?
    var forkCount: Int?
    var size: Int?
    var openIssues: Int?
    var language: String?
    var creationDate: String?
    var updateDate: String?
    var url: String?
    var defaultBranch: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            navigationItem.title = name
        }
        if let descriptionRepository = descriptionRepository {
            descriptionLabel.text = descriptionRepository
        } else {
            descriptionLabel.text = ""
        }
        if let watcherCount = watcherCount {
            watcherCountLabel.text = "\(watcherCount)"
        } else {
            watcherCountLabel.text = "0"
        }
        if let starCount = starCount {
            starCountLabel.text = "\(starCount)"
        } else {
            starCountLabel.text = "0"
        }
        if let forkCount = forkCount {
            forkCountLabel.text = "\(forkCount)"
        } else {
            forkCountLabel.text = "0"
        }
        if let size = size {
            sizeLabel.text = "\(size)"
        } else {
            sizeLabel.text = "0"
        }
        if let openIssues = openIssues {
            openIssuesLabel.text = "\(openIssues)"
        } else {
            openIssuesLabel.text = "0"
        }
        if let language = language {
            languageLabel.text = language
        } else {
            languageLabel.text = ""
        }
        if let creationDate = creationDate {
            creationDateLabel.text = creationDate
        } else {
            creationDateLabel.text = ""
        }
        if let updateDate = updateDate {
            updateDateLabel.text = updateDate
        } else {
            updateDateLabel.text = ""
        }
        if let url = url {
            urlLabel.text = url
        } else {
            urlLabel.text = ""
        }
        if let defaultBranch = defaultBranch {
            defaultBranchLabel.text = defaultBranch
        } else {
            defaultBranchLabel.text = ""
        }
    }
}
