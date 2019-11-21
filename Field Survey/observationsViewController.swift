//
//  observationsViewController.swift
//  Field Survey
//
//  Created by Davis Haeusser on 11/20/19.
//  Copyright © 2019 Davis Haeusser. All rights reserved.
//

import UIKit

class observationsViewController: UIViewController {

    @IBOutlet weak var observationImage: UIImageView!
    @IBOutlet weak var observationLabel: UILabel!
    @IBOutlet weak var observationdateLabel: UILabel!
    @IBOutlet weak var observationDescription: UILabel!
    
    var name = String()
    var time = String()
    var icon = String()
    var observations = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        observationLabel.text = name
        observationdateLabel.text = time
        observationDescription.text = observations
        observationImage.image = UIImage(named: icon)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
