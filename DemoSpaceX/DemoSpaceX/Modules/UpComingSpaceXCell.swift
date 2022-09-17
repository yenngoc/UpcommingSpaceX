//
//  UpComingSpaceXCell.swift
//  DemoSpaceX
//
//  Created by Y on 16/09/2022.
//

import UIKit
import NKButton
import FrameLayoutKit

final class SpaceXCell: UITableViewCell {
    static let identifier = "SpaceXCell"

    let frameLayout = StackFrameLayout(axis: .vertical)

    private let iconImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_notification")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }

    private let spaceXNameLabel = UILabel().then {
        $0.text = ""
        $0.font = .appFont(ofSize: 16, weight: .semibold)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }

    private let roketLabel = UILabel().then {
        $0.text = ""
        $0.numberOfLines = 0
        $0.font = .appFont(ofSize: 18, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private let lauchPadLabel = UILabel().then {
        $0.text = ""
        $0.numberOfLines = 0
        $0.font = .appFont(ofSize: 12, weight: .regular)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private let flightNumberLabel = UILabel().then {
        $0.text = ""
        $0.numberOfLines = 0
        $0.font = .appFont(ofSize: 18, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private let dateLabel = UILabel().then {
        $0.text = ""
        $0.numberOfLines = 0
        $0.font = .appFont(ofSize: 12, weight: .regular)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    var data: SpaceX? {
        didSet {
            setupData()
        }
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(frameLayout)
        addSubview(iconImageView)
        addSubview(spaceXNameLabel)
        addSubview(lauchPadLabel)
        addSubview(roketLabel)
        addSubview(flightNumberLabel)
        addSubview(dateLabel)
        backgroundColor = .brown
        frameLayout.with {
            $0.padding(top: 12, left: 30, bottom: 12, right: 0)
            
            $0 + spaceXNameLabel
            $0 + roketLabel
            $0 + lauchPadLabel
            $0 + flightNumberLabel
            $0 + dateLabel
            
            ($0 + 0).flexible()
        }
    }
    
    private func setupData() {
        spaceXNameLabel.text = data?.name?.uppercased()
        roketLabel.text = data?.rocket
        lauchPadLabel.text = data?.launchpad
        flightNumberLabel.text = "\(data?.flightNumber ?? 0)"
       
        if let date = data?.dateUtc?.formateDate(from: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
                                                  to: "dd/MM/yyyy") {
            dateLabel.text = date
            
        }
        
        layoutIfNeeded()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        frameLayout.frame = bounds
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return frameLayout.sizeThatFits(size)
    }
}

