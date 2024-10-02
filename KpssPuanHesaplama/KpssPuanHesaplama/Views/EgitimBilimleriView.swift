//
//  EgitimBilimleriView.swift
//  KpssPuanHesaplama
//
//  Created by Furkan buğra karcı on 30.09.2024.
//

import SwiftUI

struct EgitimBilimleriView: View {
    @State private var gkDogrusayisi:Double=30
    @State private var gkYanlissayisi:Double=0
    
    @State private var gyDogrusayisi:Double=30
    @State private var gyYanlissayisi:Double=0
    
    @State private var ebDogrusayisi:Double=40
    @State private var ebYanlissayisi:Double=0
    
    @State private var sonuc2022:Double = 0
    @State private var sonuc2023:Double = 0
    @State private var sonucEB2023:Double = 0
    @State private var sonucEB2022:Double = 0
    var body: some View {
        VStack {
            
            Form{
               
                Section{
                    Stepper("Doğru Sayısı:\(gyDogrusayisi,specifier: "%.0f")", value: $gyDogrusayisi, in:1...60)
                        .bold()
                        .sensoryFeedback(.selection, trigger: gyDogrusayisi)
                    Stepper("Yanlış Sayısı:\(gyYanlissayisi,specifier: "%.0f")", value: $gyYanlissayisi, in:0...60)
                        .bold()
                        .sensoryFeedback(.selection, trigger: gyYanlissayisi)
                }header: {
                    Text("Genel Yetenek")
                        .textCase(.none)
                }
            footer:{
                if(gyDogrusayisi+gyYanlissayisi>60){
                    Text("Toplam doğru ve yanlış sayısı 60`ı geçemez")
                        .foregroundStyle(.red)
                }
            }
                Section{
                    Stepper("Doğru Sayısı:\(gkDogrusayisi,specifier: "%.0f")", value: $gkDogrusayisi, in:1...60)
                        .bold()
                        .sensoryFeedback(.selection, trigger: gkDogrusayisi)
                    Stepper("Yanlış Sayısı:\(gkYanlissayisi,specifier: "%.0f")", value: $gkYanlissayisi, in:0...60)
                        .bold()
                        .sensoryFeedback(.selection, trigger: gkYanlissayisi)
                }header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                        
                }
            footer:{
                if(gkDogrusayisi+gkYanlissayisi>60){
                    Text("Toplam doğru ve yanlış sayısı 60`ı geçemez")
                        .foregroundStyle(.red)
                }
            }
                Section{
                    Stepper("Doğru Sayısı:\(ebDogrusayisi,specifier: "%.0f")", value: $ebDogrusayisi, in:1...80)
                        .bold()
                        .sensoryFeedback(.selection, trigger: ebDogrusayisi)
                    Stepper("Yanlış Sayısı:\(ebYanlissayisi,specifier: "%.0f")", value: $ebYanlissayisi, in:0...80)
                        .bold()
                        .sensoryFeedback(.selection, trigger: ebYanlissayisi)
                }header: {
                    Text("Eğitim Bilimleri")
                        .textCase(.none)
                        
                }
            footer:{
                if(ebDogrusayisi+ebYanlissayisi>80){
                    Text("Toplam doğru ve yanlış sayısı 80`ı geçemez")
                        .foregroundStyle(.red)
                }
            }
                Section{
                    VStack(alignment: .leading) {
                        Text("2023 P3(Memur): \(sonuc2023,specifier: "%.3f")")
                            .bold()
                        Text("2023 P10(Öğretmen): \(sonucEB2023,specifier: "%.3f")")
                            .bold()
                    }
                    VStack(alignment: .leading) {
                        Text("2022 P3(Memur): \(sonuc2022,specifier: "%.3f")")
                            .bold()
                        Text("2022 P10(Öğretmen): \(sonucEB2022,specifier: "%.3f")")
                            .bold()
                    }
                    
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogrusayisi - (gkYanlissayisi/4)
                        let gyNet = gyDogrusayisi - (gyYanlissayisi/4)
                        let ebNet = ebDogrusayisi - (ebYanlissayisi/4)
                        withAnimation {
                            sonucEB2022 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                            sonuc2022 = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                            sonucEB2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                            sonuc2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                        }
                    }
                    .disabled(formcontrol)
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                }
            
            }
            
        }
        .navigationTitle("Eğitim Bilimleri")
    }
    
    var formcontrol:Bool {
        if(gkDogrusayisi+gkYanlissayisi > 60 || gyDogrusayisi+gyYanlissayisi>60 || ebDogrusayisi + ebYanlissayisi > 80){
            return true
        }
            return false
    }
}


#Preview {
    EgitimBilimleriView()
}
