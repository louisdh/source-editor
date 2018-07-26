//
//  ViewController.swift
//  iOS Example
//
//  Created by Louis D'hauwe on 25/07/2018.
//  Copyright © 2018 Silver Fox. All rights reserved.
//

import UIKit
import SavannaKit
import SourceEditor

class ViewController: UIViewController {

	let lexer = SwiftLexer()
	
	@IBOutlet weak var syntaxTextView: SyntaxTextView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		syntaxTextView.theme = DefaultSourceCodeTheme()
		syntaxTextView.delegate = self

	}


}

extension ViewController: SyntaxTextViewDelegate {
	
	func didChangeText(_ syntaxTextView: SyntaxTextView) {
		
		
	}
	
	func didChangeSelectedRange(_ syntaxTextView: SyntaxTextView, selectedRange: NSRange) {
		
		
	}
	
	func lexerForSource(_ source: String) -> Lexer {
		return lexer
	}
	
}
