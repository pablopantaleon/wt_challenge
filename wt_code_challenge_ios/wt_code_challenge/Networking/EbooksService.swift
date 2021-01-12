//
//  EbooksService.swift
//  wt_code_challenge
//
//  Created by Pablo Reyes on 1/11/21.
//

import Foundation
import Alamofire

protocol EbooksServiceProtocol {
    func getAllEbooks(ebooksPresenter: EbooksPresenter)
}

class EbooksService: EbooksServiceProtocol {
    
    func getAllEbooks(ebooksPresenter: EbooksPresenter) {
        AF.request("http://de-coding-test.s3.amazonaws.com/books.json", method: .get)
            .responseDecodable(of: [Ebook].self) { (response) in
                guard let ebooks = response.value else {
                    ebooksPresenter.onEbooksFailed()
                    return
                }
                ebooksPresenter.onEbooksLoaded(ebooks: ebooks)
            }
    }
}

