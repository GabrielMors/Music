//
//  DetailViewController.swift
//  AppMusic
//
//  Created by Gabriel Mors  on 23/08/23.
//

import UIKit

class DetailViewController: UIViewController {

    var screen: DetailScreen?
    var cardModel: CardViewModel?
    
    override func loadView() {
        self.screen = DetailScreen(dataView: self.cardModel ?? CardViewModel())
        view = screen
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configAllDelegate(tableViewDelegate: self, tableviewDataSource: self, scrollViewDelegate: self, detailScreenProtocol: self)
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension DetailViewController: DetailScreenProtocol {
    func tappedCloseButton() {
        dismiss(animated: true)
    }
}
