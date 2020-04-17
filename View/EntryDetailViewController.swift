//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Jimmy Brown on 4/16/20.
//  Copyright © 2020 Jimmy Brown. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let titleText = titleTextField.text, let bodyText = bodyTextView.text, !titleText.isEmpty, !bodyText.isEmpty else { return }
        
        if let entry = entry {
            EntryController.sharedInstance.update(entry: entry, title: titleText, body: bodyText)
        } else {
            EntryController.sharedInstance.addEntryWith(newTitleName: titleText, newBody: bodyText)
        }
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearTextButton(_ sender: Any) {
        titleTextField.text = nil
        bodyTextView.text = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        guard let entry = entry, isViewLoaded else{ return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
}
