//
//  KQBottomSheet.swift
//  PanModalDemo
//
//  Created by Nathaniel Brion Sison on 6/22/21.
//

import UIKit
import SnapKit
import PanModal

class KQBottomSheet: UIViewController {
    
    var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let view1 = UIView()
        view1.backgroundColor = .red
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        
        mainStackView.addArrangedSubview(view1)
        mainStackView.addArrangedSubview(label)
        mainStackView.addArrangedSubview(view2)
        
        view1.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        view2.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
    }
}

extension KQBottomSheet: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var longFormHeight: PanModalHeight {
        return .intrinsicHeight
    }
}
