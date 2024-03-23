//
//  CurrenyFormatterTests.swift
//  BankyUnitTests
//
//  Created by Admin on 3/22/24.
//

import XCTest


@testable import Banky

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp(){
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsAndCents() throws {
        let result = formatter.breakIntoDollarsAndCents(111002.19)
        XCTAssertEqual(result.0, "111,002")
        XCTAssertEqual(result.1, "19")
    }
    
    func testDollarsFormatted() throws{
        let result = formatter.dollarsFormatted(111002.19)
        XCTAssertEqual(result, "$111,002.19")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.00)
        XCTAssertEqual(result, "$0.00")
    }
    
    func testDollarsFormattedWithCurrencySymbol() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormatted(111002.19)
        XCTAssertEqual(result, "\(currencySymbol)111,002.19")
    }
    
}
