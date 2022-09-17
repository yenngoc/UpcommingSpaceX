//
//  UpcomingSpaceService.swift
//  DemoSpaceX
//
//  Created by Y on 11/09/2022.
//

import Foundation

class  UpcomingSpaceService: APIService {
    func fetchListUpcomingSpaceXFromServer(completionBlock: (([SpaceX]?, Error?)-> Void)? = nil) {
        self.requestArray(UpcomingSpaceXInput.GetUpcomingSpaceXInput(), completion: completionBlock)
    }
    
    func fetchListUpcomingSpaceX(completionBlock: (([SpaceX]?, Error?)-> Void)? = nil) {
        self.fetchListUpcomingSpaceXFromServer { objects, err in
            guard let objects = objects else {return}
            SpaceX.saveAllObjects(allObjects: objects, objectKey: UserDefaults.Keys.spaceX)
            completionBlock?(objects, err)
        }
    }
 
}


    
    
