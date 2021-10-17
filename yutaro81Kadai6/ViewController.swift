//
//  ViewController.swift
//  yutaro81Kadai6
//
//  Created by 雄太郎 on 2021/10/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var numslider: UISlider!
    @IBOutlet weak private var sliderLabel: UILabel!
    private var randomNum = Int.random(in: 1...100)
    override func viewDidLoad() {
        super.viewDidLoad()
        getNum()
    }
    @IBAction private func judgeButton(_ sender: Any) {
        let ramdomValue = Int(numslider.value)
    // アラートに結果と値を表示する
        if  randomNum == ramdomValue {
            var rightAnswer = "当たり"
            rightAnswer += "\nあなたの値: \(ramdomValue)"
            presentAlert(message: rightAnswer)
        } else {
            var wrongAnswer = "はずれ"
            wrongAnswer += "\nあなたの値: \(ramdomValue)"
            presentAlert(message: wrongAnswer)
        }
        getNum()
    }
    // アラートのメソッド
    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "再挑戦", style: .default, handler: nil)
        alert.addAction(okAlert)
        present(alert, animated: true, completion: nil)
    }
    // sliderLabelの更新,sliderをセンターに戻す
    private func getNum() {
        randomNum = Int.random(in: 1...100)
        sliderLabel.text = String(randomNum)
        numslider.value = 50
    }
}
