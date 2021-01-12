//
//  EbookTableCell.swift
//  wt_code_challenge
//
//  Created by Pablo Reyes on 1/11/21.
//

import Foundation
import UIKit

class EbookTableCell: UITableViewCell {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var author: UILabel!
    
    func bind(ebook: Ebook) {
        name.text = ebook.title
        author.text = ebook.author
        
        guard let imageUrl = ebook.image else { return }
        coverImage.addImage(from: imageUrl)
    }
}
