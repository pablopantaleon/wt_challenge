//
//  MainViewController.swift
//  wt_code_challenge
//
//  Created by Pablo Reyes on 1/11/21.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    static private let ebooksIdentifier = "ebooksTableViewCell"
    private var ebooks: [Ebook] = []
    
    @IBOutlet weak var ebooksTableView: UITableView!
    
    lazy var loader: EbooksLoader = {
        let ebooksActioner = EbooksActioner()
        ebooksActioner.delegate = self
        return ebooksActioner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        let nib = UINib(nibName: EbookTableCell.typedName, bundle: nil)
        ebooksTableView.register(nib, forCellReuseIdentifier: MainViewController.ebooksIdentifier)
        ebooksTableView.delegate = self
        ebooksTableView.dataSource = self
        showActivityIndicator()
        loader.getEbooks()
    }
}

extension MainViewController: EbooksPresenter, SupportsIndicator {
    
    func onEbooksLoaded(ebooks: [Ebook]) {
        hideActivityIndicator()
        self.ebooks.append(contentsOf: ebooks)
        self.ebooksTableView.reloadData()
    }
    
    func onEbooksFailed() {
        hideActivityIndicator()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ebooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ebook = ebooks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewController.ebooksIdentifier, for: indexPath) as? EbookTableCell
        cell?.bind(ebook: ebook)
        return cell ?? UITableViewCell(style: .subtitle, reuseIdentifier: MainViewController.ebooksIdentifier)
    }
}
