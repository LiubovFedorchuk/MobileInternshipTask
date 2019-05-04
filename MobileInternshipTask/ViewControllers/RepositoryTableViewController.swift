//
//  RepositoryTableViewController.swift
//  MobileInternshipTask
//
//  Created by Liubov Fedorchuk on 5/4/19.
//  Copyright © 2019 Liubov Fedorchuk. All rights reserved.
//

import UIKit

class RepositoryTableViewController: UITableViewController {
    
    var repositoryList: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryTableViewCell", for: indexPath) as? RepositoryTableViewCell else {
            fatalError("The dequeued cell is not an instance of RepositoryTableViewCell.")
        }
        
        let repository = repositoryList[indexPath.row]
        cell.repositoryNameLabel.text = repository.name
        if let description = repository.description {
            cell.repositoryDescriptionLabel.text = description
        }
        
        if let updateDate = repository.updatedAt?.convertDateFormatAsString() {
            cell.updateDateLabel.text = "Updated on " + updateDate
        }

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "showRepositoryDetails":
            guard let detailsViewController = segue.destination as? DetailsViewController else {
                log.error("Unexpected destination: \(segue.destination)")
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedRepositoryTableViewCell = sender as? RepositoryTableViewCell else {
                log.error("Unexpected sender: \(String(describing: sender))")
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedRepositoryTableViewCell) else {
                log.error("The selected cell is not being displayed by the table")
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedRepository = repositoryList[indexPath.row]
            detailsViewController.name = selectedRepository.name
            detailsViewController.descriptionRepository = selectedRepository.description
            detailsViewController.watcherCount = selectedRepository.watchersCount
            detailsViewController.starCount = selectedRepository.stargazersCount
            detailsViewController.forkCount = selectedRepository.forksCount
            detailsViewController.language = selectedRepository.language
            detailsViewController.creationDate = selectedRepository.createdAt?.convertDateFormatAsString()
            detailsViewController.updateDate = selectedRepository.updatedAt?.convertDateFormatAsString()
            detailsViewController.defaultBranch = selectedRepository.defaultBranch
            detailsViewController.url = selectedRepository.url
            detailsViewController.openIssues = selectedRepository.openIssuesCount
            detailsViewController.size = selectedRepository.size
            
        default:
            log.error("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
}
