//
//  ContentView.swift
//  BMIformula
//
//  Created by mohammed alsaad on 21/05/2023.
//

import SwiftUI

struct ContentView: View {
  @State var hight : Double = 1
  @State var weght : Double = 1
  var min: Double = 0
  var max: Double = 250
  @State var result : Double = 0

  var temperatureString : String {
     return String(format:"%.2f", result)
  }
  var body: some View {
    ZStack{
      Color.cyan
        .ignoresSafeArea(.all)

      if result < 18.5 {
        Color.yellow
          .ignoresSafeArea()
      } else if result >= 18.5 && result < 25 {
        Color.green
          .ignoresSafeArea()
      } else {
        Color.red
          .ignoresSafeArea()
      }

      VStack(spacing: 10) {

        Text("Your Hight: \(Int(hight))")
        Slider(value: $hight, in: min...max)
          .accentColor(.white)
          .padding()
        Text("Your weght: \(Int(weght))")
        Slider(value: $weght, in: min...max)
          .padding()
          .accentColor(.white)

        Button {
          hight = hight / 100
          result = weght / pow(hight, 2)
        } label: {
          Text("Test!")
            .frame(maxWidth: .infinity , maxHeight: 20)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
            .padding(.top, 13)
            .padding(.bottom, 25)
            .padding()
        }
        .padding()

        if result < 18.5 {
          Image("under")
            .resizable()
            .frame(width: 150 ,height: 150)
          Text("your IBM:\(result , specifier: "%.2f") !")
            .font(.largeTitle)
          Text("you are UNDERWEIGT!")
            .font(.largeTitle)
        } else if result >= 18.5 && result < 25 {
          Image("normal")
            .resizable()
            .frame(width: 150 ,height: 150)
          Text("your IBM:\(result , specifier: "%.2f") !")
            .font(.largeTitle)
          Text("Normal Weight!")
            .font(.largeTitle)
        } else {
          Image("over")
            .resizable()
            .frame(width: 150 ,height: 150)
          Text("your IBM:\(result , specifier: "%.2f") !")
            .font(.largeTitle)
          Text("You are OVERWEIGHT!")
            .font(.largeTitle)
        }
      }
    }
  }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
