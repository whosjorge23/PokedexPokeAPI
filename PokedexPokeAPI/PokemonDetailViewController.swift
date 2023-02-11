//
//  PokemonDetailViewController.swift
//  PokedexPokeAPI
//
//  Created by Giorgio Giannotta on 10/02/23.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    var pokemon: Pokemon!
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(nameLabel)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
        view.addSubview(pokemonImageView)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            heightLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            heightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            weightLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 8),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            weightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            pokemonImageView.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 8),
            pokemonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 200),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        nameLabel.text = pokemon.name
//        heightLabel.text = "Height: \(pokemon.height)"
//        weightLabel.text = "Weight: \(pokemon.weight)"
//        pokemonImageView.image = pokemon.sprites.front_default
    }
}


