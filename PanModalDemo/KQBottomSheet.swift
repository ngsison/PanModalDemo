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
    
    // MARK: - UI Props
    
    lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()
    
    // MARK: - Internal Props
    
    var scrollingEnabled: Bool
    
    // MARK: - Lifecycle Events
    
    init(scrollingEnabled: Bool = false) {
        self.scrollingEnabled = scrollingEnabled
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Private Methods
    
    private func setUpViews() {
        
        view.backgroundColor = .systemBackground
        
        if scrollingEnabled {
            
            view.addSubview(mainScrollView)
            mainScrollView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            let contentView = UIView()
            mainScrollView.addSubview(contentView)
            contentView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.width.equalToSuperview()
                make.height.equalToSuperview().priority(.low)
            }
            
            contentView.addSubview(mainStackView)
            mainStackView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
        } else {
            
            view.addSubview(mainStackView)
            mainStackView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        // Sample Content
        
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

// MARK: - PanModalPresentable

extension KQBottomSheet: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return mainScrollView
    }
    
    var longFormHeight: PanModalHeight {
        return .intrinsicHeight
    }
}
