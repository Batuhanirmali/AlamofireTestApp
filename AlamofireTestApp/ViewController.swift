//
//  ViewController.swift
//  AlamofireTestApp
//
//  Created by Talha Batuhan Irmalı on 16.01.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    private let url = "https://jsonplaceholder.typicode.com"
    private var photos: [Photo] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoTableViewCell")
        
        self.fetchData()
    }
    
    private func fetchData() {
        AF.request(self.url + "/photos", method: .get).responseDecodable(of: [Photo].self) { [weak self] response in
            self?.photos = response.value ?? []
            self?.tableView.reloadData()
        }
    }


}

extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as? PhotoTableViewCell {
            cell.photo = self.photos[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
