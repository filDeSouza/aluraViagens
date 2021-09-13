//
//  DetalhesViagensViewController.swift
//  Alura Viagens
//
//  Created by Filipe de Souza on 12/09/21.
//

import UIKit

class DetalhesViagensViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tfData: UITextField!
    
    var pacoteSelecionado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll), name:UIResponder.keyboardWillShowNotification, object: nil)

        
        if let pacote = pacoteSelecionado{
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    @objc func aumentarScroll(notification: Notification){
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height + 320)
    }
    
    @IBAction func btVoltar(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func exibeDataTextField(sender: UIDatePicker){
        let formatador = DateFormatter()
        formatador.dateFormat = "dd MM yyyy"
        self.tfData.text = formatador.string(from: sender.date)
    }
    
    @IBAction func tfDataValidadeCartao(_ sender: UITextField) {
        
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataTextField), for: .valueChanged)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
