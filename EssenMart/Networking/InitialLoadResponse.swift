//
//  User.swift
//  Networking
//
//  Created by Janbaz Ali on 21/08/2024.
//

import Foundation

struct InitialLoadResponse: Decodable {
    let banners: [String]
    let vouchers: [Voucher]
    let flashSales: [FlashSale]
    let categories: [Category]
    let freeShipping: [FreeShipping]
    let segments: [Segment]
}

struct Voucher: Decodable {
    let discountAmount: Double
    let voucherType: String
}

struct FlashSale: Decodable {
    let iconUrl: String
    let newPrice: Double
    let oldPrice: Double
}

struct Category: Decodable {
    let iconUrl: String
    let categoryName: String
}

struct FreeShipping: Decodable {
    let oldPrice: Double
    let newPrice: Double
}

struct Segment: Decodable {
    let name: String
    let identifier: String
}

