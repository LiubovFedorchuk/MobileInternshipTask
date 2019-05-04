//
//  RepositoryManager.swift
//  MobileInternshipTask
//
//  Created by Liubov Fedorchuk on 5/4/19.
//  Copyright © 2019 Liubov Fedorchuk. All rights reserved.
//

import Alamofire
import CodableAlamofire

/**
    # Service
 
    [GitHUb API: Repository]: https://developer.github.com/v3/repos/#list-user-repositories
 
    Usage: to get a list of user repositories.
 
    See also: [GitHUb API: Repository]
 
 */

class RepositoryManager {

    func getRepositoriesList(username: String,
                             completionHandler: @escaping ([Repository]?, Int?) -> Void) {
        let decoder = JSONDecoder()
        Alamofire.request(Constant.BASE_URL + "/users/\(username)/repos").responseDecodableObject(keyPath: nil, decoder: decoder) { (response: DataResponse<[Repository]>) in
            let status = response.response?.statusCode
            switch response.result {
            case .success:
                guard let status = status else {
                    log.error("Request passed without status code - status code is nil.")
                    completionHandler(nil, nil)
                    return
                }
                
                guard status == 200,
                    let repositoryData = response.result.value else {
                        log.debug("Request passed with status code, but not 200 OK: \(status)")
                        completionHandler(nil, status)
                        return
                }
                completionHandler(repositoryData, status)
                
            case .failure(let error):
                guard let status = status else {
                    log.error("Request failure with error: \(error.localizedDescription)")
                    completionHandler(nil, nil)
                    return
                }
                log.error("Request failure with status code: \(status) and error: \(error.localizedDescription)")
                completionHandler(nil, status)
            }
        }
    }
}
