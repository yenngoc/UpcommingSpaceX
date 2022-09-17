//
//  UpcomingSpaceXViewModel.swift
//  DemoSpaceX
//
//  Created by Y on 11/09/2022.
//

import Foundation

class UpcomingSpaceXViewModel: NSObject {
    
    private var apiService : UpcomingSpaceService!
    
    private(set) var spaceXData : [SpaceX]? {
        didSet {
            self.bindDataViewModelToController()
        }
    }
    
    var bindDataViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        
        self.apiService =  UpcomingSpaceService()
        callFuncToGetData()
    }
    
    func callFuncToGetData() {
        // check local exist
        guard let objects = SpaceX.getAllObjects, objects.count > 0 else {
            self.apiService.fetchListUpcomingSpaceX { (listData, error)  in
                self.spaceXData = listData
            }
            
            return
            
        }
        
        self.spaceXData = objects
    }
    
    func updateDataAtStoreLocal(objects: [SpaceX]) {
        SpaceX.saveAllObjects(allObjects: objects, objectKey: UserDefaults.Keys.spaceX)
        self.spaceXData = objects
    }
    
}
