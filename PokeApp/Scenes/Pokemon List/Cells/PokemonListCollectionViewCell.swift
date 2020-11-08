//
//  PokemonListCollectionViewCell.swift
//  PokeApp
//
//  Created by Claudio Barbera on 08/11/2020.
//

import UIKit

class PokemonListCollectionViewCell: UICollectionViewCell, ReusableView {
    
    // MARK: - Properties
    var viewModel: PokemonViewModel? {
        didSet {
            titleLabel.text = viewModel?.pokemonNameText
            pictureImageView.loadImage(from: viewModel?.pokemonImageURL)
        }
    }
    
    // MARK: - UI properties
    lazy var pictureImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "placeholder")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [pictureImageView, titleLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .center
        return view
    }()
    
    // MARK: - Object lifecycle
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        pictureImageView.image = UIImage(named: "placeholder")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
        configureConstraints()
    }
   
    required init(coder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    // MARK: - Configure methods
    
    private func configureUI() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        
        // stackView
        contentView.addSubview(stackView)
    
    }

    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            // stackView
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PokemonListCollectionViewCell_Previews: PreviewProvider {

    static var previews: some View {
        PokemonListCollectionViewCell().makePreview().previewLayout(.fixed(width: 200, height: 200))
    }
}
#endif
