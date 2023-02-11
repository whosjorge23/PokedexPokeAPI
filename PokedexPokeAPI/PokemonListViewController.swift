import UIKit
import Alamofire

class PokemonListViewController: UITableViewController {
    
    private var pokemonList = [Pokemon]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokemon List"
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PokemonCell")
        
        self.fetchPokemonList()
    }
    
    private func fetchPokemonList() {
        let url = "https://pokeapi.co/api/v2/pokemon?limit=9"
        
        AF.request(url).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                do {
                    let data = try JSONSerialization.data(withJSONObject: value)
                    let response = try JSONDecoder().decode(PokemonResponse.self, from: data)
                    self.pokemonList = response.results
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
        let pokemon = pokemonList[indexPath.row]
        cell.textLabel?.text = pokemon.name
        
        let pokemonDetailsURL = pokemon.url
        AF.request(pokemonDetailsURL).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                do {
                    let data = try JSONSerialization.data(withJSONObject: value)
                    let pokemonDetails = try JSONDecoder().decode(PokemonDetails.self, from: data)
                    if let sprite = pokemonDetails.sprites.front_default {
                        AF.request(sprite).validate().responseData { (response) in
                            switch response.result {
                            case .success(let data):
                                if let image = UIImage(data: data) {
                                    cell.imageView?.image = image
                                    cell.setNeedsLayout()
                                }
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                    }

                } catch {
                    print(error)
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPokemon = pokemonList[indexPath.row]
        performSegue(withIdentifier: "showPokemonDetail", sender: selectedPokemon)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPokemonDetail" {
            if let destinationVC = segue.destination as? PokemonDetailViewController,
                let selectedPokemon = sender as? Pokemon {
                destinationVC.pokemon = selectedPokemon
            }
        }
    }
}
