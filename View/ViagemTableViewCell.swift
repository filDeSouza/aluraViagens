//
//  ViagemTableViewCell.swift
//  Alura Viagens
//
//  Created by Filipe de Souza on 04/09/21.
//

import UIKit

class ViagemTableViewCell: UITableViewCell {

    static let identifier = "viagemCell"
    let numberFormatter = NumberFormatter()
    
    var viagem: Viagem? {
        didSet{
            setData()
        }
    }
    
    @IBOutlet weak var labelDestino: UILabel!
    @IBOutlet weak var imgViewDestino: UIImageView!
    @IBOutlet weak var labelDuracao: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    private func setupNumberFormatter(){
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
    }
    
    func configuraCelula(viagem: Viagem){
        
        imgViewDestino.layer.cornerRadius = 10
        imgViewDestino.clipsToBounds = true
        labelDestino.text = viagem.titulo
        labelPreco.text = "R$ \(viagem.preco)"
        labelDuracao.text = viagem.quantidadeDeDias == 1 ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        imgViewDestino.image = UIImage(named: viagem.caminhoDaImagem)
    }
    
    private func setData(){
        guard let viagem = viagem else {return}
        
        labelDestino.text = viagem.titulo
        labelPreco.text = viagem.preco
        labelDuracao.text = "\(viagem.quantidadeDeDias) dias"
        imgViewDestino.image = UIImage(named: viagem.caminhoDaImagem)
    }
    


}
