//
//  ViewController.swift
//  Portal Berita
//
//  Created by Yoenas on 05/11/18.
//  Copyright © 2018 Yoenas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbViewBerita: UITableView!
    var berita: [Berita]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchBerita()
        
    }

    func fetchBerita(){
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-sport&apiKey=45edc79fad7c497f957b65c3a95d605f")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            
            if error != nil{
                print(error as Any)
                return
            }
            
            self.berita = [Berita]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let articleFromJSON = json["articles"] as? [[String: AnyObject]]{
                    for articleJSON in articleFromJSON {
                        
                        let berita = Berita()
                        
                        if let title = articleJSON["title"] as? String,
                            let author = articleJSON["author"] as? String,
                            let desc = articleJSON["description"] as? String,
                            let url = articleJSON["url"] as? String,
                            let urlImage = articleJSON["urlToImage"] as? String {
                            
                            berita.judul = title
                            berita.author = author
                            berita.deskripsi = desc
                            berita.url = url
                            berita.imgUrl = urlImage
                        }
                        self.berita?.append(berita)
                    }
                    
                    DispatchQueue.main.async {
                         self.tbViewBerita.reloadData()
                    }
                }
                
            } catch let error {
            print(error)
            }
        }
        
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.berita?.count ?? 0
    }
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBerita", for: indexPath) as! BeritaCell
        cell.lbJudul.text = self.berita?[indexPath.item].judul
        cell.lbDeskripsi.text = self.berita?[indexPath.item].deskripsi
        cell.lbAuthor.text = self.berita?[indexPath.item].author
        cell.imgBerita.downloadImage(from: (self.berita?[indexPath.item].imgUrl!)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}


extension UIImageView{
    func downloadImage(from url: String){
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            
            if error != nil{
                print(error as Any)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
