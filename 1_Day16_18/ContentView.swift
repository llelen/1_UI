//
//  ContentView.swift
//  O1_D16_part2_WeSplit
//
//  Created by GayaneA on 10/9/19.
//  Copyright © 2019 GayaneA. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    
    @State private var tipPercentage = 2
    let tipPercentages = [10,15,20,25,0]
    
    
    
    var TotalPerPeople: Double {
        
        let peopleCount = Double((Int(numberOfPeople) ?? 2))
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount * Double(tipPercentages[tipPercentage]) / 100
        let grandTotal = orderAmount + tipValue
       
       return grandTotal / peopleCount
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Cheque/Bill")){
                    TextField("Enter amount", text: $checkAmount).keyboardType(.decimalPad).foregroundColor(.red)
                    }.foregroundColor(.red)
                    
                Section(header: Text("How much tip do you want to leave?")){
                        Picker("Tip Percent", selection: $tipPercentage) {
                            ForEach(0..<tipPercentages.count){
                                Text("\(self.tipPercentages[$0])%")
                            }    }.pickerStyle(SegmentedPickerStyle())    }
                    
               
                
                Section(header: Text("Number Of People")){
                    TextField("Enter number od people", text: $numberOfPeople).keyboardType(.decimalPad)
                    // Text("LLLL")
                    
               }
                
                Section(header: Text("Amount per person")){
                        
                    Text("$\(TotalPerPeople, specifier: "%.2f")" )
                    }
                
                Section{
                    Text("Total Amount: \(TotalPerPeople * Double(((Int(numberOfPeople) ?? 2))), specifier: "%.2f")")
                }.foregroundColor(.green)
            }.navigationBarTitle("WeSplit")
        }//NavigationView
    }//body
}//ContentView

//(Text("SwiftUI"), displayMode: .inline)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
