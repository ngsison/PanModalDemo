//
//  ViewController.swift
//  PanModalDemo
//
//  Created by Nathaniel Brion Sison on 6/22/21.
//

import UIKit
import SnapKit
import PanModal

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Present bottom sheet", for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    @objc
    private func handleButtonTap() {
        let bottomSheet = KQBottomSheetExampleVC()
        presentPanModal(bottomSheet)
    }
    
    private func setUpViews() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
