//
//  PokemonListTableViewCell.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell, ReusableView {
    
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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "placeholder")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Object lifecycle
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        pictureImageView.image = UIImage(named: "placeholder")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureUI()
        configureConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    // MARK: - Configure methods
    
    private func configureUI() {
        backgroundColor = UIColor(named: "AccentColor")
        
        // titleLabel
        contentView.addSubview(titleLabel)
        
        // pictureImageView
        contentView.addSubview(pictureImageView)
    }

    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            // titleLabel
            titleLabel.leadingAnchor.constraint(equalTo: pictureImageView.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            // pictureImageView
            pictureImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pictureImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            pictureImageView.heightAnchor.constraint(equalToConstant: 50),
            pictureImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PokemonListTableViewCell_Previews: PreviewProvider {

    static var previews: some View {
        PokemonListTableViewCell().makePreview().previewLayout(.fixed(width: 375, height: 70))
    }
}
#endif
