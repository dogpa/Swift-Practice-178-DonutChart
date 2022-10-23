//
//  ContentView.swift
//  Swift Practice 178 DonutChart
//
//  Created by Dogpa's MBAir M1 on 2022/10/23.
//

import SwiftUI

//取的手機螢幕的寬度
let screenWidth = UIScreen.main.bounds.width

struct ContentView: View {
    //取得DataViewModel
    @StateObject var vm = DataViewModel()
    
    var body: some View {
        
        VStack {
            Spacer(minLength: 25)
            
            //甜甜圈圓環圖
            //如果點選到該項分類則放大甜甜圈圓環的寬度
            ZStack {
                ForEach(0..<vm.dataArray.count, id: \.self) {data in
                    DonutSliceView(width: data == vm.selectIndex ? 40 : 35,trimFrom: vm.sliceIndexArray[data], trimTo: vm.sliceIndexArray[data+1], sliceColor: vm.ramdonColorArray[data])
                        .onTapGesture {
                            vm.selectIndex = data
                        }
                }
                
                //顯示總額與點選到的分類的所佔比例
                VStack {
                    
                    Text("\(String(format: "%.2f", vm.totalAmount))")
                    if vm.selectIndex != nil {
                        Text("\(vm.dataArray[vm.selectIndex!].item) :  \(String(format: "%.2f", vm.dataArray[vm.selectIndex!].amount/vm.totalAmount*100)) %")
                    }
                }
            }
            .frame(width: 250, height: 250)
            
            Spacer(minLength: 30)
            
            //透過ScrollView來顯示每個分類的分類名稱、總額、與所佔百分比
            //如果上面甜甜圈圓環圖選到的項目，則顯示為紅色
            ScrollView {
                ForEach(0..<vm.dataArray.count, id: \.self) { data in
                    HStack {
                        Text(vm.dataArray[data].item)
                            .frame(width: screenWidth/4, alignment: .leading)
                        Text("\(String(format: "%.2f", vm.dataArray[data].amount))")
                            .frame(width: screenWidth/4, alignment: .leading)
                        
                        Text("\(String(format: "%.2f", vm.dataArray[data].amount/vm.totalAmount*100))%")
                        
                            .frame(width: screenWidth/4, alignment: .trailing)
                    }
                    .foregroundColor(data == vm.selectIndex ? .red : .black)
                }
            }
            
            //產生隨機分類的陣列
            Button {
                vm.createRamdonArray()
            } label: {
                Text("產生隨機分類")
            }
        }

        .onAppear {
            vm.createRamdonArray()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
