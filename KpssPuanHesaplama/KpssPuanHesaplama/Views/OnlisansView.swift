//
//  OnlisansView.swift
//  KpssPuanHesaplama
//
//  Created by Furkan buğra karcı on 30.09.2024.
//


import SwiftUI

struct OnlisansView: View {
    @State private var gkDogrusayisi:Double=50
    @State private var gkYanlissayisi:Double=0
    
    @State private var gyDogrusayisi:Double=40
    @State private var gyYanlissayisi:Double=0
    
    @State private var sonuc:Double = 0
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
                    Text("KPSS Puanı: \(sonuc,specifier: "%.3f")")
                        .bold()
                    
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogrusayisi - (gkYanlissayisi/4)
                        let gyNet = gyDogrusayisi - (gyYanlissayisi/4)
                        
                        withAnimation {
                            sonuc = 53.816 + gyNet * 0.43 + gkNet * 0.397
                        }
                    }
                    .disabled(formcontrol)
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                }
            
            }
            
        }
        .navigationTitle("Önlisans")
    }
    
    var formcontrol:Bool {
        if(gkDogrusayisi+gkYanlissayisi > 60 || gyDogrusayisi+gyYanlissayisi>60){
            return true
        }
            return false
    }
}

#Preview {
    OnlisansView()
}

