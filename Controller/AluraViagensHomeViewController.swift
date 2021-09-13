//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Filipe de Souza on 04/09/21.
//

import UIKit

class AluraViagensHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var viewPacote: UIView!
    @IBOutlet weak var viewHotel: UIView!
    @IBOutlet weak var tableView: UITableView!
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "viagemCell", for: indexPath) as? ViagemTableViewCell else{
            return UITableViewCell()
        }
        cell.imgViewDestino.layer.cornerRadius = 10
        cell.imgViewDestino.clipsToBounds = true
        let viagem = listaViagens[indexPath.row]
        
        cell.labelDestino.text = viagem.titulo
        cell.labelPreco.text = "R$ \(viagem.preco)"
        cell.labelDuracao.text = "\(viagem.quantidadeDeDias) dias"
        cell.imgViewDestino.image = UIImage(named: viagem.caminhoDaImagem)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }
    
}


