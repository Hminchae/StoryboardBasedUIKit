//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by 황민채 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchingTextRect: UIView!
    @IBOutlet weak var searchingTextField: UITextField!

    @IBOutlet weak var searchWordButton: UIButton!
    
    @IBOutlet weak var firstRelatedWord: UIButton!
    @IBOutlet weak var secondRelatedWord: UIButton!
    @IBOutlet weak var thirdRelatedWord: UIButton!
    @IBOutlet weak var fourthRelatedWord: UIButton!
    
    @IBOutlet weak var searchedWordRect: UIImageView!
    @IBOutlet weak var searchedTextLabel: UILabel!
    @IBOutlet weak var wordDescriptionLabel: UILabel!
    
    var firstRandomWord = ""
    var secondRandomWord = ""
    var thirdRandomWord = ""
    var fourthRandomWord = ""
    
    // MARK: 4개 버튼의 신조어를 섞는 함수
    func randomWord() {
        newWordDictionary.shuffle()
        firstRandomWord = newWordDictionary[0].word
        secondRandomWord = newWordDictionary[1].word
        thirdRandomWord = newWordDictionary[2].word
        fourthRandomWord = newWordDictionary[3].word
    }
    
    // MARK: 단어를 검색하는 함수
    // 레이블에 검색한 단어를 표출
    // - 단어가 공백이면 검색어를 입력하라고 표출
    // 아래 레이블에 검색 결과를 표출
    // - 검색 결과가 없으면 검색결과가 없다고 표출
    // 검색과 동시에 랜덤 단어도 변경하여 표출 -> randomWord() 후 뷰 레이블도 변경
    func searchWord(_ word: String) {
        searchedTextLabel.text = "\(word) 은/는"
        
        var result: String = ""
        
        for i in newWordDictionary {
            if i.word == word {
                result = i.description
            }
        }
        
        if result == "" {
            if word == "" {
                searchedTextLabel.text = "검색어를 입력하세요."
            } else {
                print("왜 안돼?")
                wordDescriptionLabel.text = "검색 결과가 없습니다 ㅜ0ㅜ 재빨리 업데이트 할게요!"
            }
        } else {
            wordDescriptionLabel.text = result
        }
        
        randomWord()
        
        firstRelatedWord.setTitle(firstRandomWord, for: .normal)
        secondRelatedWord.setTitle(secondRandomWord, for: .normal)
        thirdRelatedWord.setTitle(thirdRandomWord, for: .normal)
        fourthRelatedWord.setTitle(fourthRandomWord, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomWord()
        
        searchingTextRect.layer.borderColor = UIColor.black.cgColor
        searchingTextRect.layer.borderWidth = 2
        
        searchWordButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchWordButton.backgroundColor = .black
        searchWordButton.tintColor = .white
        searchWordButton.setTitle("", for: .normal)
        
        searchingTextField.textColor = .black
        searchingTextField.borderStyle = .none
        
        firstRelatedWord.layer.borderColor = UIColor.black.cgColor
        firstRelatedWord.layer.cornerRadius = 10
        firstRelatedWord.layer.borderWidth = 1
        firstRelatedWord.tintColor = .black
        firstRelatedWord.setTitle(firstRandomWord, for: .normal)
        
        secondRelatedWord.layer.borderColor = UIColor.black.cgColor
        secondRelatedWord.layer.cornerRadius = 10
        secondRelatedWord.layer.borderWidth = 1
        secondRelatedWord.tintColor = .black
        secondRelatedWord.setTitle(secondRandomWord, for: .normal)
        
        thirdRelatedWord.layer.borderColor = UIColor.black.cgColor
        thirdRelatedWord.layer.cornerRadius = 10
        thirdRelatedWord.layer.borderWidth = 1
        thirdRelatedWord.tintColor = .black
        thirdRelatedWord.setTitle(thirdRandomWord, for: .normal)
        
        fourthRelatedWord.layer.borderColor = UIColor.black.cgColor
        fourthRelatedWord.layer.cornerRadius = 10
        fourthRelatedWord.layer.borderWidth = 1
        fourthRelatedWord.tintColor = .black
        fourthRelatedWord.setTitle(fourthRandomWord, for: .normal)
        
        searchedWordRect.image = UIImage(named: "background")
        searchedWordRect.contentMode = .scaleAspectFill
        
        searchedTextLabel.text = ""
        searchedTextLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        searchedTextLabel.textAlignment = .center
        
        wordDescriptionLabel.font = .systemFont(ofSize: 18, weight: .regular)
        wordDescriptionLabel.textAlignment = .center
        wordDescriptionLabel.text = "신조어를 검색해보세요!"
        wordDescriptionLabel.numberOfLines = 4
    }

    @IBAction func searchButtonClicked(_ sender: UIButton) {
        searchWord(searchingTextField.text ?? "")
    }
    
    @IBAction func returnButtonClicked(_ sender: UITextField) {
        searchWord(searchingTextField.text ?? "")
    }
    
    @IBAction func firstButtonClicked(_ sender: UIButton) {
        searchWord(firstRandomWord)
    }
    @IBAction func secondButtonClicked(_ sender: UIButton) {
        searchWord(secondRandomWord)
    }
    @IBAction func thirdButtonClicked(_ sender: UIButton) {
        searchWord(thirdRandomWord)
    }
    @IBAction func fourthButtonClicked(_ sender: UIButton) {
        searchWord(fourthRandomWord)
    }
}

