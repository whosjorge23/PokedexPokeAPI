//
//  ViewController.swift
//  PokedexPokeAPI
//
//  Created by Giorgio Giannotta on 10/02/23.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pokemonListVC = PokemonListViewController()
        let favoritePokemonVC = FavoritePokemonViewController()
                
        pokemonListVC.tabBarItem = UITabBarItem(title: "PokemonList", image: nil, tag: 0)
        favoritePokemonVC.tabBarItem = UITabBarItem(title: "Favorites", image: nil, tag: 0)
                
        self.setViewControllers([pokemonListVC, favoritePokemonVC], animated: false)
    }


}

