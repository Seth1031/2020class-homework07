//
//  ResultViewController.swift
//  2020class-homework07
//
//  Created by Seth on 2020/4/3.
//  Copyright © 2020 Seth. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    let rank:[String] = ["", "1.04%", "6.13%", "18.94%", "39.40%", "62.37%", "81.35%", "92.91%", "98.04%", "99.65%", "99.97%", "100.00%"]
    var gameScore: Int!
    var playerResult: [String]!
    @IBOutlet weak var round1Label: UILabel!
    @IBOutlet weak var round2Label: UILabel!
    @IBOutlet weak var round3Label: UILabel!
    @IBOutlet weak var round4Label: UILabel!
    @IBOutlet weak var round5Label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        round1Label.text = playerResult[1]
        round2Label.text = playerResult[2]
        round3Label.text = playerResult[3]
        round4Label.text = playerResult[4]
        round5Label.text = playerResult[5]
        scoreLabel.text = String("總得分：\(gameScore!)分")
        scoreDescription.text = String("你勝過了全世界 \(rank[gameScore/10])的人")

        // Do any additional setup after loading the view.
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
