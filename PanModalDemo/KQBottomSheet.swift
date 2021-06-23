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
