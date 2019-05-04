//
//  Connectivity.swift
//  MobileInternshipTask
//
//  Created by Liubov Fedorchuk on 5/4/19.
//  Copyright © 2019 Liubov Fedorchuk. All rights reserved.
//

import Alamofire

class Connectivity {
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
