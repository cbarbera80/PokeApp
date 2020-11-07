//
//  PokemonDetailsView.swift
//  PokeApp
//
//  Created by Claudio Barbera on 07/11/2020.
//

import UIKit

class PokemonDetailsView: UIView {
    
    // MARK: - Private properties
    var pokemonViewModel: PokemonDetailViewModel? {
        didSet {
            nameLabel.text = pokemonViewModel?.pokemonNameText
            pictureImageView.loadImage(from: pokemonViewModel?.pokemonImageURL)
            heightLabel.text = pokemonViewModel?.heightText
            weightLabel.text = pokemonViewModel?.weightText
            abilitiesScrollView.items = pokemonViewModel?.abilities
            statsScrollView.items = pokemonViewModel?.stats
            typesScrollView.items = pokemonViewModel?.types
        }
    }
    
    // MARK: - UI properties

    lazy var loadingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        return view
    }()
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        //view.clipsToBounds = true
        return view
    }()
    
    lazy var pictureImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "placeholder")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var heightLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var weightLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var abilitiesLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 18)
        view.text = "Abilities"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var abilitiesScrollView: ScrollingView = {
        let view = ScrollingView(items: [], foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), backgroundColor: #colorLiteral(red: 0.984359324, green: 0.7612621188, blue: 0.01381021645, alpha: 1))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var statsLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 18)
        view.text = "Statistics"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var statsScrollView: ScrollingView = {
        let view = ScrollingView(items: [], foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), backgroundColor: #colorLiteral(red: 0.9606108069, green: 0.286811769, blue: 0.2232251167, alpha: 1))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var typesLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 18)
        view.text = "Types"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var typesScrollView: ScrollingView = {
        let view = ScrollingView(items: [], foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), backgroundColor: #colorLiteral(red: 0.2769687176, green: 0.6646058559, blue: 0.2823570073, alpha: 1))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Object lifecycle
        
    init() {
        super.init(frame: .zero)
        configureUI()
        configureConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    // MARK: - Configure methods
    
    private func configureUI() {
        backgroundColor = UIColor(named: "AccentColor")
        
        // loadingView
        addSubview(loadingView)
        
        // loadingIndicator
        loadingView.addSubview(loadingIndicator)
        
        // cardView
        addSubview(cardView)
        
        // nameLabel
        cardView.addSubview(nameLabel)
        
        // pictureImageView
        cardView.addSubview(pictureImageView)
        
        // heightLabel
        cardView.addSubview(heightLabel)
        
        // weightLabel
        cardView.addSubview(weightLabel)
        
        // typesLabel
        cardView.addSubview(abilitiesLabel)
        
        // typesScrollView
        cardView.addSubview(abilitiesScrollView)
        
        // statsLabel
        cardView.addSubview(statsLabel)
        
        // statsScrollView
        cardView.addSubview(statsScrollView)
        
        // typesLabel
        cardView.addSubview(typesLabel)
        
        // typesScrollView
        cardView.addSubview(typesScrollView)
    }

    private func configureConstraints() {
        
        NSLayoutConstraint.activate([

            // loadingView
            loadingView.topAnchor.constraint(equalTo: topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            // loadingIndicator
            loadingIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            
            // cardView
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            // pictureImageView
            pictureImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            pictureImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: -75),
            pictureImageView.heightAnchor.constraint(equalToConstant: 150),
            pictureImageView.widthAnchor.constraint(equalToConstant: 150),
            
            // nameLabel
            nameLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 16),
            
            // heightLabel
            heightLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            heightLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            
            // heightLabel
            weightLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            weightLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 8),
            
            // abilitiesLabel
            abilitiesLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            abilitiesLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20),
            
            // abilitiesScrollView
            abilitiesScrollView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            abilitiesScrollView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            abilitiesScrollView.topAnchor.constraint(equalTo: abilitiesLabel.bottomAnchor, constant: 16),
            abilitiesScrollView.heightAnchor.constraint(equalToConstant: 30),
            
            // statsLabel
            statsLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            statsLabel.topAnchor.constraint(equalTo: abilitiesScrollView.bottomAnchor, constant: 24),
            
            // statsScrollView
            statsScrollView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            statsScrollView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            statsScrollView.topAnchor.constraint(equalTo: statsLabel.bottomAnchor, constant: 16),
            statsScrollView.heightAnchor.constraint(equalToConstant: 30),
            
            // typesLabel
            typesLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            typesLabel.topAnchor.constraint(equalTo: statsScrollView.bottomAnchor, constant: 24),
            
            // typesLabel
            typesScrollView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            typesScrollView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            typesScrollView.topAnchor.constraint(equalTo: typesLabel.bottomAnchor, constant: 16),
            typesScrollView.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    func startLoading() {
        loadingView.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func stopLoading() {
        loadingView.isHidden = true
        loadingIndicator.stopAnimating()
    }

}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PokemonDetailsView_Previews: PreviewProvider {
    
    static var view: PokemonDetailsView {
        let view = PokemonDetailsView()
        view.pokemonViewModel = PokemonDetailViewModel(withPokemon: PokemonDetails.mocked)
        return view
    }
    static var previews: some View {
        view.makePreview().previewLayout(.fixed(width: 375, height: 812))
    }
}
#endif
