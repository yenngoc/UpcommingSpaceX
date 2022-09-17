//
//  UpComingSpaceXController.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import UIKit
import FrameLayoutKit
import NKButton
import SwiftyJSON

class UpComingSpaceXController: BaseViewController {
    
    let frameLayout = DoubleFrameLayout().then {
        $0.spacing = 30
        $0.axis = .vertical
        $0.backgroundColor = .clear
        $0.padding(top: 20, left: 30.0, bottom: 20.0, right: 30)
        $0.ignoreHiddenView = false
    }
    
    var tableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.tableFooterView = UIView()
        $0.separatorStyle = .none
        $0.register(SpaceXCell.self, forCellReuseIdentifier: SpaceXCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.allowsSelectionDuringEditing = false
    }
    
    private let tempCell = SpaceXCell(style: .default, reuseIdentifier: nil)
    
    // viewModel to binding data
    private var spaceXViewModel : UpcomingSpaceXViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(frameLayout)
        view.addSubview(tableView)
        
        frameLayout.with {
            ($0 + tableView).padding(top: self.view.safeAreaInsets.top + 60.0, left: 0, bottom: 0, right: 0)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        callToViewModelForUIUpdate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func callToViewModelForUIUpdate(){
        
        self.spaceXViewModel =  UpcomingSpaceXViewModel()
        self.spaceXViewModel.bindDataViewModelToController = {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        frameLayout.frame = view.bounds
    }
    
    func configCell(_ cell: SpaceXCell, indexPath: IndexPath) {
        cell.data = spaceXViewModel.spaceXData?[indexPath.row]
    }
}

extension UpComingSpaceXController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.spaceXViewModel.spaceXData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SpaceXCell.identifier, for: indexPath) as? SpaceXCell else { return UITableViewCell() }
        configCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        configCell(tempCell, indexPath: indexPath)
        return tempCell.sizeThatFits(tableView.bounds.size).height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard var arr = self.spaceXViewModel.spaceXData else {return}
            arr.remove(at: indexPath.row)
            self.spaceXViewModel.updateDataAtStoreLocal(objects: arr)
//            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
