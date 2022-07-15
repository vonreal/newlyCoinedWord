//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 나지운 on 2022/07/10.
//

import UIKit

enum NewCoinedWordList: String {
    case 쫌쫌따리 = "쫌쫌따리"
    case 억텐 = "억텐"
    case 스불재 = "스불재"
    case 좋댓구알 = "좋댓구알"
    case 어쩔티비 = "어쩔티비"
    case 갓생 = "갓생"
    case 점메추 = "점메추"
    case 다꾸 = "다꾸"
    case 킹받다 = "킹받다"
    case 군싹 = "군싹"
    
    func returnWordMean() -> String {
        switch self {
        case .쫌쫌따리: return "아주 조금씩 하찮은 양을 모으는 모습."
        case .억텐: return "억지 텐션의 줄임말. 억지로 텐션을 올려서 발라하게 행동할 때"
        case .스불재: return "스스로 불러온 재앙의 줄임말. 자신이 계획한 일로 자신이 고통을 받을 때 씀"
        case .좋댓구알: return "좋아요, 댓글, 구독, 알림 설정."
        case .어쩔티비: return "어쩌라고 가서 TV나 봐라라는 뜻. '저쩔티비'나 '어쩔'뒤에 전자제품을 붙여 맞받아치면 됨."
        case .갓생: return "부지런하고 열심히 사는 사람에게 쓰는 말"
        case .점메추: return "점심 메뉴 추천"
        case .다꾸: return "다이어리 꾸미. 자매품으로 위꾸(위장 꾸미기=먹기), 뇌꾸(뇌 꾸미기=공부)등이 있음"
        case .킹받다: return "열받다라는 뜻. 킹(King)을 붙여 강조함. 자매품으로 같은 뜻인 킹받드라슈가 있음."
        case .군싹: return "군침이 싹도네의 줄임말로 뽀로로 루피짤과 세트로 유명해졌음"
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet var keywordButtons: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    
    var idx = 0
    lazy var keywordList = ["좋댓구알", "스불재", "억텐", "쫌쫌따리"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
    }
    
    // MARK: - [CODE - 검색한 신조어 의미 출력]
    func printResultInLabel(_ label: UILabel) {
        guard searchTextField.hasText else { return }
        let res: NewCoinedWordList? = NewCoinedWordList(rawValue: searchTextField.text!)
        
        if let mean = res?.returnWordMean() {
            label.text = mean
        } else {
            label.text = "아직 앱에서 제공하지 않는 신조어입니다."
        }
    }
    
    // MARK: - [CODE - 검색한 신조어 keywordList에 반영]
    func changeKeywordList() {
        guard let result = searchTextField.text else { return }
        guard (NewCoinedWordList(rawValue: result) != nil) else { return }
        
        if !keywordList.contains(result) {
            keywordList[idx] = result
            // idx = idx < 3 ? idx += 1 : 0
            if idx < 3 { idx += 1 } else { idx = 0 }
        }
        designKeywordButton(keywordButtons, title: keywordList)
    }
    
    // MARK: - [ACTIONS]
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
    
    // MARK: =  신조어 버튼 클릭 시 의미 출력
    @IBAction func keywordButtonClicked(_ sender: UIButton) {
        guard let res = sender.currentTitle else { return }
        searchTextField.text = res
        printResultInLabel(resultLabel)
    }
    
    // MARK: - [DESIGNS]
    func designUI() {
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
    
}

