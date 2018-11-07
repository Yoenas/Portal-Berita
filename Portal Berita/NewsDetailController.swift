//
//  NewsDetailController.swift
//  Portal Berita
//
//  Created by Yoenas on 07/11/18.
//  Copyright © 2018 Yoenas. All rights reserved.
//

import UIKit

class NewsDetailController: UIViewController {
    
    @IBOutlet weak var lbDetailTitle: UILabel!
    @IBOutlet weak var imgNewsDetail: UIImageView!
    @IBOutlet weak var tvContent: UITextView!
    
    var accomodateCont: String?
    var accomodateTitle: String?
    var accomodateImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = try? Data(contentsOf: URL(string: accomodateImage!)!)
        
        lbDetailTitle.text = accomodateTitle
        tvContent.text = accomodateCont
        imgNewsDetail.image = UIImage(data: data!)
    }

}
