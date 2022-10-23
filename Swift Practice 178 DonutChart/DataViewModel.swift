//
//  DataViewModel.swift
//  Swift Practice 178 DonutChart
//
//  Created by Dogpa's MBAir M1 on 2022/10/23.
//


import SwiftUI

final class DataViewModel : ObservableObject {
    //分類陣列
    var ramdonItemArray = ["飲食","大眾交通","旅遊","醫藥保健","科技3C","服飾","娛樂","雜項","投資","汽機車","進修","房租"]
    
    //顏色陣列
    var ramdonColorArray: [Color] = [.red, .yellow, .brown, .orange, .pink, .blue, .green, .black, .gray, .cyan, .mint, .purple, .indigo]
    
    //儲存所有開銷總額
    var totalAmount:Double = 0
    
    //儲存甜甜圈圖trim的值
    var sliceIndexArray:[Double] = []
    
    //儲存隨機產生的DataModel陣列
    @Published var dataArray = [DataModel]()
    
    //儲存點選甜甜圈的值
    @Published var selectIndex: Int? = nil
    
    
    
    /// 產生隨機DataModel陣列
    func createRamdonArray () {
        selectIndex = nil
        ramdonItemArray.shuffle()
        ramdonColorArray.shuffle()
        dataArray = []
        for i in 0...Int.random(in: 5...11) {
            dataArray.append(DataModel(item: ramdonItemArray[i], amount: Double.random(in: 100...10000)))
        }

        calculateTotalAmount ()
        
        calculateSliceIndex ()
        
    }
    
    
    /// 計算總額後儲存到totalAmount
    func calculateTotalAmount () {
        totalAmount = 0
        for i in 0 ..< dataArray.count {
            totalAmount += dataArray[i].amount
        }
    }
    
    //透過每一次加總計算所佔的比例，給Circle的trim使用
    func calculateSliceIndex () {
        sliceIndexArray = [0]
        var sliceAdd: Double = 0
        for i in 0 ..< dataArray.count {
            sliceAdd += dataArray[i].amount
            sliceIndexArray.append(sliceAdd/totalAmount)
        }
        sliceIndexArray.append(1)
    }
}
