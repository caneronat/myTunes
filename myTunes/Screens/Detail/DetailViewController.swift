//
//  DetailViewController.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit
import Kingfisher

protocol DetailViewInputs: AnyObject {
    func prepareUI()
    func onDetail(data:Result)
}

protocol DetailViewOutputs: AnyObject {
    func viewDidLoad()
   
}

class DetailViewController: UIViewController {
 
    @IBOutlet weak var ivDetail: UIImageView!
    @IBOutlet weak var lblTrackName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!

    internal var presenter: DetailViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func btnDismissTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension DetailViewController: DetailViewInputs {
    
    func prepareUI() {
        
    }
    
    func onDetail(data: Result) {
        lblTrackName.text = data.trackName
        lblArtistName.text = data.artistName
        ivDetail.kf.setImage(with: URL(string: data.artworkUrl100), placeholder: UIImage(named: "loading_placeholder"))
    }

}

extension DetailViewController: Viewable { }

