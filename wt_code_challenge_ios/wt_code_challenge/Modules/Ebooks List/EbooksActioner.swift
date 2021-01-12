//
//  EbooksActioner.swift
//  wt_code_challenge
//
//  Created by Pablo Reyes on 1/11/21.
//

import Foundation

protocol EbooksPresenter: class {
    
    /**
     * Result with all ebooks data
     */
    func onEbooksLoaded(ebooks: [Ebook])
    
    /**
     * Result failed
     */
    func onEbooksFailed()
}

protocol EbooksLoader {
    func getEbooks()
}

class EbooksActioner: EbooksLoader {
    weak var delegate: EbooksPresenter?
    private let ebooksService: EbooksServiceProtocol
    
    init() {
        ebooksService = EbooksService()
    }
    
    func getEbooks() {
        guard let presenter = delegate else { return }
        ebooksService.getAllEbooks(ebooksPresenter: presenter)
    }
}
