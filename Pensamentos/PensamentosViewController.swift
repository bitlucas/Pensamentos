//
//  PensamentosViewController.swift
//  Pensamentos
//
//  Created by Lucas Bitar on 03/09/18.
//  Copyright © 2018 Lucas Bitar. All rights reserved.
//

import UIKit

class PensamentosViewController: UIViewController {

    @IBOutlet weak var ivFoto: UIImageView!
    @IBOutlet weak var ivFotoBg: UIImageView!
    
    @IBOutlet weak var lbPensamento: UILabel!
    @IBOutlet weak var lbAutor: UILabel!
    
    @IBOutlet weak var lcTop: NSLayoutConstraint!
    
    let config = Configuration.shared
    let quotesManager = PensamentoManager()
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareQuote()
        formatView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatView(){
        
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        lbPensamento.textColor = config.colorScheme == 0 ? .black : .white
        lbAutor.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        
    }

    func prepareQuote() {
        timer?.invalidate()
        if config.autorefresh == true {
        timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true, block: { (timer) in
            self.showRandomQuote()
        })
        }
        showRandomQuote()
    }
    
    func showRandomQuote() {
        let quote = quotesManager.getRandomQuote()
        lbPensamento.text = quote.quote
        lbAutor.text = quote.author
        ivFoto.image = UIImage(named: quote.image)
        ivFotoBg.image = ivFoto.image
        
        lbPensamento.alpha = 0.0
        lbAutor.alpha = 0.0
        ivFoto.alpha = 0.0
        ivFotoBg.alpha = 0.0
        lcTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 02.5) {
            self.lbPensamento.alpha = 1.0
            self.lbAutor.alpha = 1.0
            self.ivFoto.alpha = 1.0
            self.ivFotoBg.alpha = 0.25
            self.lcTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }
}
