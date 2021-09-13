//
//  PacoteViagemCollectionViewCell.swift
//  Alura Viagens
//
//  Created by Filipe de Souza on 11/09/21.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelqtdDias: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    
    func configuraCelula(pacoteViagem: PacoteViagem){
        imagemViagem.image = UIImage(named: pacoteViagem.viagem.caminhoDaImagem)
        labelTitulo.text = pacoteViagem.viagem.titulo
        labelqtdDias.text = pacoteViagem.viagem.quantidadeDeDias == 1 ? "1 dia" : "\(pacoteViagem.viagem.quantidadeDeDias) dias"
        labelValor.text = "R$ \(pacoteViagem.viagem.preco)"
        

    }
    
}
