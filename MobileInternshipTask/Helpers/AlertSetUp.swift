//
//  AlertSetUp.swift
//  MobileInternshipTask
//
//  Created by Liubov Fedorchuk on 5/4/19.
//  Copyright © 2019 Liubov Fedorchuk. All rights reserved.
//

import UIKit

class AlertSetUp {
    
    func showAlertAccordingToStatusCode(fromController controller: UIViewController,
                                        statusCode: Int) {
        switch(statusCode) {
        case 401:
            let alert = showAlert(alertTitle: "Unauthorized",
                                  alertMessage: "Bad credentials. Please, check your credentials and try again.")
            controller.present(alert, animated: true, completion: nil)
            log.warning("Unauthorized")
        case 403:
            let alert = showAlert(alertTitle: "Forbidden",
                                  alertMessage: "Please, try again later.")
            controller.present(alert, animated: true, completion: nil)
            log.warning("Forbidden")
        case 404:
            let alert = showAlert(alertTitle: "Not Found",
                                  alertMessage: "User with this username not found. Please, check username and try again later.")
        controller.present(alert, animated: true, completion: nil)
        log.warning("Not Found")
        case 500...526:
            let alert = showAlert(alertTitle: "Service unavailable",
                                  alertMessage: "Please, try again later.")
            controller.present(alert, animated: true, completion: nil)
            log.warning("Service unavailable")
        default:
            let alert = showAlert(alertTitle: "Unexpected error",
                                  alertMessage: "Please, try again later.")
            controller.present(alert, animated: true, completion: nil)
            log.error("Unexpected error with status code: \(statusCode)")
        }
    }
    
    func showAlert(alertTitle: String,
                   alertMessage: String) -> UIAlertController {
        let alert = UIAlertController(title: alertTitle,
                                      message: alertMessage,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            UserDefaults.standard.set(true, forKey: "AcctionOkPressed")
            log.debug("Ok pressed")
        }
        alert.addAction(okAction)
        return alert
    }
}
