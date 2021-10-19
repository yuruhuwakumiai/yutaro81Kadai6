//
//  ViewController.swift
//  yutaro81Kadai6
//
//  Created by 雄太郎 on 2021/10/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var numslider: UISlider!
    @IBOutlet weak private var answerLabel: UILabel!
    private var randomNum = Int.random(in: 1...100)

    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }

    @IBAction private func judgeButton(_ sender: Any) {
        let ramdomValue = Int(numslider.value)
        // アラートに結果と値を表示する
        let resultText: String
        if randomNum == ramdomValue {
            resultText = "当たり"
        } else {
            resultText = "はずれ"
        }
        let message = "\(resultText)\nあなたの値: \(ramdomValue)"
        presentAlert(message: message)
        resetGame()
    }

    // アラートのメソッド
    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(
            title: "再挑戦",
            style: .default,
            handler: { [weak self] _ in
                self?.resetGame()
            }
        )
        alert.addAction(okAlert)
        present(alert, animated: true, completion: nil)
    }

    // sliderLabelの更新,sliderをセンターに戻す
    private func resetGame() {
        randomNum = Int.random(in: 1...100)
        answerLabel.text = String(randomNum)
        numslider.value = 50
    }
}
