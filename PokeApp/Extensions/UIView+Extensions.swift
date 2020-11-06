//
//  UIView+Extensions.swift
//  PokeApp
//
//  Created by claudio barbera
//  Copyright © 2020 iqui All rights reserved.
//

import UIKit
import SwiftUI

extension UIView {
    
    func pin(to view: UIView, insets: UIEdgeInsets = .zero) {
        removeFromSuperview()
        translatesAutoresizingMaskIntoConstraints = false
        
        bounds = view.frame
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: insets.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom)
        ])
    }
    
    private struct Preview<View: UIView>: UIViewRepresentable {
        
        // MARK: - Properties
        
        let view: View
        
        // MARK: - Methods

        func makeUIView(context: Context) -> View { view }
        
        func updateUIView(_ uiView: View, context: Context) {}
    }

    @available(iOS 13.0.0, *)
    func makePreview() -> some View {
        Preview(view: self)
    }
}
