//
//  SuperStackViewTests.swift
//  SuperStackViewTests
//
//  Created by Himanshu Arora on 08/11/20.
//

import XCTest
@testable import SuperStackView

class SuperStackViewTests: XCTestCase {
    
    func testSetRowHiddenDuplicateCalls() {
        let stackView = SuperStackView()
        let row = UIView()
        stackView.addRow(row)
        
        stackView.setRowHidden(row, isHidden: true, animated: true)
        stackView.setRowHidden(row, isHidden: true, animated: true)
        stackView.setRowHidden(row, isHidden: false, animated: true)
        
        XCTAssertFalse(stackView.isRowHidden(row))
    }
    
    func testRowCounts() {
        let stackView = SuperStackView()
        let row1 = UIView()
        let row2 = UIView()
        stackView.addRow(row1)
        stackView.addRow(row2)
        XCTAssertTrue(stackView.rowsCount == 2)
    }
    
}
