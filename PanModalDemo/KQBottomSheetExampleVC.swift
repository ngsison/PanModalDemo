//
//  KQBottomSheetExampleVC.swift
//  PanModalDemo
//
//  Created by Nathaniel Brion Sison on 6/23/21.
//

import UIKit

class KQBottomSheetExampleVC: KQBottomSheet {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        
        let sampleView1 = UIView()
        sampleView1.backgroundColor = .red
        
        let sampleLabel = UILabel()
        sampleLabel.numberOfLines = 0
        sampleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        let sampleView2 = UIView()
        sampleView2.backgroundColor = .blue
        
        mainStackView.addArrangedSubview(sampleView1)
        mainStackView.addArrangedSubview(sampleLabel)
        mainStackView.addArrangedSubview(sampleView2)
        
        sampleView1.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        sampleView2.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
    }
}
