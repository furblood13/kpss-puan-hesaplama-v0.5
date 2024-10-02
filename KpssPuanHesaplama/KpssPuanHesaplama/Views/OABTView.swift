//
//  EgitimBilimleriView.swift
//  KpssPuanHesaplama
//
//  Created by Furkan buğra karcı on 30.09.2024.
//

import SwiftUI

struct OABTView: View {
    @State private var gkDogrusayisi:Double=30
    @State private var gkYanlissayisi:Double=0
    
    @State private var gyDogrusayisi:Double=30
    @State private var gyYanlissayisi:Double=0
    
    @State private var ebDogrusayisi:Double=40
    @State private var ebYanlissayisi:Double=0
    
    @State private var oabtDogrusayisi:Double=40
    @State private var oabtYanlissayisi:Double=0
    
    @State private var sonuc2022:Double = 0
    @State private var sonuc2023:Double = 0
    @State private var sonucEB2023:Double = 0
    @State private var sonucEB2022:Double = 0
    
    @State private var sonucOABT2022:Double = 0
    @State private var sonucOABT2023:Double = 0
    
    @State private var isShowingSheet = false
    
    @State private var oabtKatsayi  = 0.4334
    @State private var oabtPuan     = 43.805
    
    
    @State private var selectedOption = 0
    let options = [
        (0.4334,43.805, "Beden Eğitimi"),
        (0.3666,41.071, "Biyoloji"),
        (0.4301,39.060, "Coğrafya"),
        (0.4052,34.908, "Din Kültürü"),
        (0.3679,42.156, "Edebiyat"),
        (0.5388,39.313, "Fen Bilgisi"),
        (0.3817,41.604, "Fizik"),
        (0.5225,36.309, "İlköğretim Matematik"),
        (0.3883,37.962, "İmam Hatip Meslek Dersleri Ö."),
        (0.3791,40.920, "İngilizce"),
        (0.4542,42.157, "Kimya"),
        (0.4247,41.759, "Lise Matematik"),
        (0.4944,33.292, "Okul Öncesi"),
        (0.4883,29.014, "Rehberlik "),
        (0.6184,33.598, "Sınıf Öğretmenliği"),
        (0.6142,34.101, "Sosyal Bilgiler"),
        (0.3521,41.418, "Tarih"),
        (0.4565,34.329, "Türkçe")
    ]
    
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
                    Picker("Bölüm Seçiniz", selection: $selectedOption){
                        ForEach(0..<options.count,id:\.self){index in
                            HStack{
                                Image(systemName: "book.closed.fill")
                                //.2 yapmanın sebebi options dizisindeki ikinci elemanı kullanmak istememiz yani ismini
                                Text(options[index].2)
                            }
                        }
                    }
                    //listede seçilen elemanı tutmamızı sağlıyor
                    .onChange(of: selectedOption){
                        //indexde hangi sıeadaysa onu veriyoz listedeki
                        oabtKatsayi = options[selectedOption].0
                        oabtPuan = options[selectedOption].1
                    }
                    Stepper("Doğru Sayısı:\(oabtDogrusayisi,specifier: "%.0f")", value: $oabtDogrusayisi, in:1...75)
                        .bold()
                        .sensoryFeedback(.selection, trigger: oabtDogrusayisi)
                    Stepper("Yanlış Sayısı:\(oabtYanlissayisi,specifier: "%.0f")", value: $oabtYanlissayisi, in:0...75)
                        .bold()
                        .sensoryFeedback(.selection, trigger: oabtYanlissayisi)
                }header: {
                    Text("ÖABT")
                        .textCase(.none)
                        
                }
            footer:{
                if(oabtDogrusayisi+oabtYanlissayisi>75){
                    Text("Toplam doğru ve yanlış sayısı 75`ı geçemez")
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
                        let oabtNet = oabtDogrusayisi - (oabtYanlissayisi/4)
                        
                            sonucEB2022 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                            sonuc2022 = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                            sonucEB2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                            sonuc2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                        sonucOABT2022 = oabtPuan + gyNet * 0.1720 + gkNet * 0.1515 + ebNet * 01498 + oabtNet * oabtKatsayi
                    }
                    .disabled(formcontrol)
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                }
            
            }
            
        }
        .navigationTitle("ÖABT")
    }
    
    var formcontrol:Bool {
        if(gkDogrusayisi+gkYanlissayisi > 60 || gyDogrusayisi+gyYanlissayisi>60 || ebDogrusayisi + ebYanlissayisi > 80 || oabtDogrusayisi+oabtYanlissayisi>75){
            return true
        }
            return false
    }
}


#Preview {
    OABTView()
}
