//
//  PokemonListTableViewCell.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import Anchorage

class PokemonListTableViewCell: UITableViewCell, ReusableView {
    
    // MARK: - Properties
    var viewModel: PokemonViewModel? {
        didSet {
            titleLabel.text = viewModel?.pokemonNameText
        }
    }
    
    // MARK: - UI properties
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    // MARK: - Object lifecycle
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    // MARK: - Configure methods
    
    private func configureUI() {
        // titleLabel
        contentView.addSubview(titleLabel)
    }

    private func configureConstraints() {
        // titleLabel
        titleLabel.leadingAnchor == contentView.leadingAnchor + 16
        titleLabel.topAnchor == contentView.topAnchor + 16
        titleLabel.bottomAnchor == contentView.bottomAnchor - 16
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
