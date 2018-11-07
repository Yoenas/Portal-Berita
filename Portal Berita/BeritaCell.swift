//
//  BeritaCell.swift
//  Portal Berita
//
//  Created by Yoenas on 05/11/18.
//  Copyright © 2018 Yoenas. All rights reserved.
//

import UIKit

class BeritaCell: UITableViewCell {

    @IBOutlet weak var imgBerita: UIImageView!
    @IBOutlet weak var lbJudul: UILabel!
    @IBOutlet weak var lbDeskripsi: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
