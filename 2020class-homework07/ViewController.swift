//
//  ViewController.swift
//  2020class-homework07
//
//  Created by Seth on 2020/3/19.
//  Copyright © 2020 Seth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var orangebtnView: UIButton!
    @IBOutlet weak var redbtnView: UIButton!
    @IBOutlet weak var greenbtnView: UIButton!
    @IBOutlet weak var bluebtnView: UIButton!
    @IBOutlet weak var purplebtnView: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var resultBtn: UIButton!
    @IBOutlet weak var roundNumber: UILabel!
    @IBOutlet weak var informLabel: UILabel!
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        let deliver = ResultViewController(coder: coder)
        deliver?.gameScore = gameScore
        deliver?.playerResult = playerResult
        return deliver     
    }
    
    var selectedColor: Int = 0
    var playerResult: [String] = Array(repeating: "", count: 6)
    var gameRound: Int = 1
    var gameScore: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func colorReset() {
        redbtnView.layer.borderColor = UIColor.clear.cgColor
        orangebtnView.layer.borderColor = UIColor.clear.cgColor
        greenbtnView.layer.borderColor = UIColor.clear.cgColor
        bluebtnView.layer.borderColor = UIColor.clear.cgColor
        purplebtnView.layer.borderColor = UIColor.clear.cgColor
    }
    
    func gameRoundUpdate(){
        roundNumber.text = String("第\(gameRound)回合 / 共5回合")
    }
    
    @IBAction func redButton(_ sender: Any) {
        if gameRound <= 5{
        selectedColor = 1
        colorReset()
        redbtnView.layer.borderWidth = 10
        redbtnView.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    
    @IBAction func orangeButton(_ sender: Any) {
        if gameRound <= 5{
        selectedColor = 2
        colorReset()
        orangebtnView.layer.borderWidth = 10
        orangebtnView.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    
    @IBAction func greenButton(_ sender: Any) {
        if gameRound <= 5{
        selectedColor = 3
        colorReset()
        greenbtnView.layer.borderWidth = 10
        greenbtnView.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    
    @IBAction func blueButton(_ sender: Any) {
        if gameRound <= 5{
        selectedColor = 4
        colorReset()
        bluebtnView.layer.borderWidth = 10
        bluebtnView.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    
    @IBAction func purpleButton(_ sender: Any) {
        if gameRound <= 5{
        selectedColor = 5
        colorReset()
        purplebtnView.layer.borderWidth = 10
        purplebtnView.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        if selectedColor != 0 {
            let randomInt = Int.random(in: 1...5)
            
            switch selectedColor {
            case 1:
                playerResult[gameRound] = "你選擇了紅色，"
            case 2:
                playerResult[gameRound] = "你選擇了黃色，"
            case 3:
                playerResult[gameRound] = "你選擇了綠色，"
            case 4:
                playerResult[gameRound] = "你選擇了藍色，"
            case 5:
                playerResult[gameRound] = "你選擇了紫色，"
            default:
                playerResult[gameRound] = ""
            }
            
            switch randomInt {
            case 1:
                playerResult[gameRound] += "正確顏色是紅色，"
            case 2:
                playerResult[gameRound] += "正確顏色是黃色，"
            case 3:
                playerResult[gameRound] += "正確顏色是綠色，"
            case 4:
                playerResult[gameRound] += "正確顏色是藍色，"
            case 5:
                playerResult[gameRound] += "正確顏色是紫色，"
            default:
                playerResult[gameRound] = ""
            }
            
            switch abs(randomInt - selectedColor) {
            case 0:
                gameScore += 20
                playerResult[gameRound] += "\n猜對了！獲得20分！"
                informLabel.text = "猜對了"
            case 1:
                gameScore += 10
                playerResult[gameRound] += "\n滿接近的，獲得10分。"
                informLabel.text = "很接近了"
            case 2:
                gameScore += 0
                playerResult[gameRound] += "\n可惜沒中…沒能得分…"
                informLabel.text = "沒猜中"
            case 3:
                gameScore += 0
                playerResult[gameRound] += "\n可惜沒中…沒能得分…"
                informLabel.text = "沒猜中"
            case 4:
                gameScore += 10
                playerResult[gameRound] += "\n滿接近的，獲得10分。"
                informLabel.text = "很接近了"
            default:
                gameScore += 0
            }
            print(playerResult)
            gameRound += 1
            colorReset()
            selectedColor = 0
            if gameRound == 6{
                confirmBtn.setTitle("答題結束", for:.normal)
                confirmBtn.isEnabled = false
                resultBtn.isEnabled = true
            }else{
            gameRoundUpdate()
            }
        }
    }
    
    @IBAction func resultBtn(_ sender: Any) {
        informLabel.text = String("得分\(gameScore)分")
    }
    
    @IBAction func retryButton(_ sender: Any) {
        gameRound = 1
        gameScore = 0
        colorReset()
        gameRoundUpdate()
        resultBtn.isEnabled = false
        confirmBtn.isEnabled = true
        confirmBtn.setTitle("確認選擇", for:.normal)
        informLabel.text = String("")
        playerResult = Array(repeating: "", count: 6)
    }
}

