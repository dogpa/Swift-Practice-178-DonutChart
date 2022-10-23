//
//  DonutSliceView.swift
//  Swift Practice 178 DonutChart
//
//  Created by Dogpa's MBAir M1 on 2022/10/23.
//

import SwiftUI

struct DonutSliceView: View {
    var width: CGFloat      //甜甜圈圓環寬度
    var trimFrom: Double    //trim開始的值
    var trimTo: Double      //trim結束的值
    var sliceColor: Color   //甜甜圈的顏色
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: trimFrom, to: trimTo)
                .stroke(sliceColor, lineWidth: width)
        }
    }
}

struct DonutSliceView_Previews: PreviewProvider {
    static var previews: some View {
        DonutSliceView(width: 20,trimFrom: 0, trimTo: 0.7, sliceColor: .brown)
    }
}
