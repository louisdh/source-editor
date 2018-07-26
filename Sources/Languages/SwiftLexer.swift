//
//  SwiftLexer.swift
//  SourceEditor
//
//  Created by Louis D'hauwe on 24/07/2018.
//  Copyright © 2018 Silver Fox. All rights reserved.
//

import Foundation
import SavannaKit

public class SwiftLexer: SourceCodeRegexLexer {
	
	public init() {
		
	}
	
	lazy var generators: [TokenGenerator] = {
		
		var generators = [TokenGenerator?]()
		
		// UI/App Kit
		generators.append(regexGenerator("\\b(NS|UI)[A-Z][a-zA-Z]+\\b", tokenType: .identifier))
		
		// Functions
		
		generators.append(regexGenerator("\\b(println|print)(?=\\()", tokenType: .identifier))
		
		generators.append(regexGenerator("(?<=\\s)\\d+", tokenType: .number))
		
		generators.append(regexGenerator("\\.\\w+", tokenType: .identifier))
		
		let keywords = "class protocol init required public internal import private nil super var let func override deinit return true false enum case if else in guard self weak static extension throws".components(separatedBy: " ")
		
		generators.append(keywordGenerator(keywords, tokenType: .keyword))
		
		let stdlibIdentifiers = "Any Array AutoreleasingUnsafePointer BidirectionalReverseView Bit Bool CFunctionPointer COpaquePointer CVaListPointer Character CollectionOfOne ConstUnsafePointer ContiguousArray Data Dictionary DictionaryGenerator DictionaryIndex Double EmptyCollection EmptyGenerator EnumerateGenerator FilterCollectionView FilterCollectionViewIndex FilterGenerator FilterSequenceView Float Float80 FloatingPointClassification GeneratorOf GeneratorOfOne GeneratorSequence HeapBuffer HeapBuffer HeapBufferStorage HeapBufferStorageBase ImplicitlyUnwrappedOptional IndexingGenerator Int Int16 Int32 Int64 Int8 IntEncoder LazyBidirectionalCollection LazyForwardCollection LazyRandomAccessCollection LazySequence Less MapCollectionView MapSequenceGenerator MapSequenceView MirrorDisposition ObjectIdentifier OnHeap Optional PermutationGenerator QuickLookObject RandomAccessReverseView Range RangeGenerator RawByte Repeat ReverseBidirectionalIndex Printable ReverseRandomAccessIndex SequenceOf SinkOf Slice StaticString StrideThrough StrideThroughGenerator StrideTo StrideToGenerator String Index UTF8View Index UnicodeScalarView IndexType GeneratorType UTF16View UInt UInt16 UInt32 UInt64 UInt8 UTF16 UTF32 UTF8 UnicodeDecodingResult UnicodeScalar Unmanaged UnsafeArray UnsafeArrayGenerator UnsafeMutableArray UnsafePointer VaListBuilder Header Zip2 ZipGenerator2".components(separatedBy: " ")
		
		generators.append(keywordGenerator(stdlibIdentifiers, tokenType: .identifier))
		
		// Line comment
		generators.append(regexGenerator("//(.*)", tokenType: .comment))
		
		// Block comment
		generators.append(regexGenerator("(/\\*)(.*)(\\*/)", options: [.dotMatchesLineSeparators], tokenType: .comment))

		// Single-line string literal
		generators.append(regexGenerator("(\"|@\")[^\"\\n]*(@\"|\")", tokenType: .string))
		
		// Multi-line string literal
		generators.append(regexGenerator("(\"\"\")(.*)(\"\"\")", options: [.dotMatchesLineSeparators], tokenType: .string))

		// Editor placeholder
		var editorPlaceholderPattern = "(<#)[^\"\\n]*"
		editorPlaceholderPattern += "(#>)"
		generators.append(regexGenerator(editorPlaceholderPattern, tokenType: .editorPlaceholder))

		return generators.compactMap( { $0 })
	}()
	
	public func generators(source: String) -> [TokenGenerator] {
		return generators
	}
	
}
