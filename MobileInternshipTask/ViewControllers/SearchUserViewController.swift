//
//  SearchUserViewController.swift
//  MobileInternshipTask
//
//  Created by Liubov Fedorchuk on 5/4/19.
//  Copyright © 2019 Liubov Fedorchuk. All rights reserved.
//

import UIKit

class SearchUserViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
   
    let alertSetUp = AlertSetUp()
    var repositoryList: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameTextField.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        if !Connectivity.isConnectedToInternet {
            log.warning("No Internet Conection. Needed turning on cellular data or use Wifi to access data.")
            let alert = alertSetUp.showAlert(alertTitle: "No Internet Connection", alertMessage: "Turn on cellular data or use Wi-Fi to access data.")
            self.present(alert, animated: true, completion: nil)
            log.debug("Alert with no internet connection error prsented successfully.")
        } else {
            searchButtonSetUp(button: searchButton)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func searchButtonSetUp(button: UIButton) {
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 33/255,
                                           green: 33/255,
                                           blue: 34/255,
                                           alpha: 1.0).cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "showUserRepositories":
            guard let repositoryTableViewController = segue.destination as? RepositoryTableViewController else {
                log.error("Unexpected destination: \(segue.destination)")
                fatalError("Unexpected destination: \(segue.destination)")
            }
            repositoryTableViewController.repositoryList = repositoryList
        default:
            log.error("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty else {
            let alert = self.alertSetUp.showAlert(alertTitle: "Text field is empty",
                                                  alertMessage: "Please, enter GitHub username.")
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let repositoryManager = RepositoryManager()
        repositoryManager.getRepositoriesList(username: username, completionHandler: { repository, status in
            guard let statusCode = status else {
                let alert = self.alertSetUp.showAlert(alertTitle: "Unexpected error", alertMessage: "Please, try again later.")
                self.present(alert, animated: true, completion: nil)
                log.error("Unexpected error without status code.")
                return
            }
            
            guard let repositories = repository, statusCode == 200 else {
                self.alertSetUp.showAlertAccordingToStatusCode(fromController: self, statusCode: statusCode)
                return
            }
            
            log.debug("Search button tapped.")
            self.repositoryList = repositories
            self.performSegue(withIdentifier: "showUserRepositories", sender: self)
        })
    }
}

