//
//  DataModel.swift
//  Swift Practice 178 DonutChart
//
//  Created by Dogpa's MBAir M1 on 2022/10/23.
//

import Foundation

struct DataModel: Identifiable {
    var id = UUID()
    var item: String    //分類項目
    var amount: Double  //金額
}
