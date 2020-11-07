//
//  ScrollingView.swift
//  PokeApp
//
//  Created by Claudio Barbera on 07/11/2020.
//

import UIKit

class ScrollingView: UIView {
    
    // MARK: - Private properties
    private let itemBackgroundColor: UIColor
    private let itemForegroundColor: UIColor
    
    var items: [String]?{
        didSet {
            guard let items = items else { return }
            items.forEach { item in
                let label = PaddingLabel()
                label.text = item
                label.textColor = itemForegroundColor
                label.backgroundColor = itemBackgroundColor
                label.layer.cornerRadius = 10
                label.clipsToBounds = true
                label.font = .boldSystemFont(ofSize: 16)
                contentView.addArrangedSubview(label)
            }
        }
    }
    
    // MARK: - UI properties
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.spacing = 16
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Object lifecycle
        
    init(items: [String], foregroundColor: UIColor = .white, backgroundColor: UIColor = .red) {
        self.items = items
        self.itemBackgroundColor = backgroundColor
        self.itemForegroundColor = foregroundColor
        super.init(frame: .zero)
        configureUI()
        configureConstraints()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    // MARK: - Configure methods
    
    private func configureUI() {
        backgroundColor = .clear
        
        //scrollView
        addSubview(scrollView)
        
        // contentView
        scrollView.addSubview(contentView)
    }

    private func configureConstraints() {
        
        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: heightAnchor)
            
        ])
    }

}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ScrollingView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScrollingView(items: ["Hello", "World"]).makePreview().previewLayout(.fixed(width: 375, height: 100))
    }
}
#endif

