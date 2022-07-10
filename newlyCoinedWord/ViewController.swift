//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 나지운 on 2022/07/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet var keywordButtons: [UIButton]!
    
    @IBOutlet weak var keywordButton1: UIButton!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let newlyCoinedWordList =
        ["쫌쫌따리":"아주 조금씩 하찮은 양을 모으는 모습.",
         "억텐":"억지 텐션의 줄임말. 억지로 텐션을 올려서 발라하게 행동할 때",
         "스불재":"스스로 불러온 재앙의 줄임말. 자신이 계획한 일로 자신이 고통을 받을 때 씀",
         "좋댓구알":"좋아요, 댓글, 구독, 알림 설정.",
         "어쩔티비":"어쩌라고 가서 TV나 봐라라는 뜻. '저쩔티비'나 '어쩔'뒤에 전자제품을 붙여 맞받아치면 됨.",
         "갓생":"부지런하고 열심히 사는 사람에게 쓰는 말",
         "점메추":"점심 메뉴 추천",
         "다꾸":"다이어리 꾸미. 자매품으로 위꾸(위장 꾸미기=먹기), 뇌꾸(뇌 꾸미기=공부)등이 있음",
         "킹받다":"열받다라는 뜻. 킹(King)을 붙여 강조함. 자매품으로 같은 뜻인 킹받드라슈가 있음.",
         "군싹":"군침이 싹도네의 줄임말로 뽀로로 루피짤과 세트로 유명해졌음"
        ]
    
    var idx = 0
    var keywordList = ["좋댓구알", "스불재", "억텐", "쫌쫌따리"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designSearchTextField(searchTextField)
        designSearchButton(searchButton)
        designKeywordButton(keywordButtons, title: keywordList)
        
    }
    
    func designSearchTextField(_ textField: UITextField) {
        textField.borderStyle = .line
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "신조어를 입력해주세요."
    }
    
    func designSearchButton(_ button: UIButton) {
        button.backgroundColor = .black
        button.tintColor = .white
    }

    func designKeywordButton(_ buttons: [UIButton], title: [String]) {
        var idx = 0
        
        for button in buttons {
            button.setTitle(title[idx], for: .normal)
            button.tintColor = .black
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 5
            idx += 1
        }
    }
    
    func printResultInLabel(_ label: UILabel) {
        guard let result = searchTextField.text else { return }
        
        if let mean = newlyCoinedWordList[result] {
            label.text = mean
        } else {
            label.text = "아직 앱에서 제공하지 않는 신조어입니다."
        }
    }
    
    func changeKeywordList() {
        guard let result = searchTextField.text else { return }
        guard (newlyCoinedWordList[result] != nil) else { return }
        
        if !keywordList.contains(result) {
            keywordList[idx] = result
            // idx = idx < 3 ? idx += 1 : 0
            if idx < 3 { idx += 1 } else { idx = 0 }
        }
        designKeywordButton(keywordButtons, title: keywordList)
    }
    
    @IBAction func tabGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        printResultInLabel(resultLabel)
        changeKeywordList()
        view.endEditing(true)
    }
    
    @IBAction func searchTextFieldReturnClicked(_ sender: UITextField) {
        printResultInLabel(resultLabel)
        changeKeywordList()
        view.endEditing(true)
    }
    
    @IBAction func keywordButtonClicked(_ sender: UIButton) {
        guard let res = sender.currentTitle else { return }
        searchTextField.text = res
        printResultInLabel(resultLabel)
    }
    
}

