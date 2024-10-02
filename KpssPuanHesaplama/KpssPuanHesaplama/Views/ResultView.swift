//
//  ResultView.swift
//  KpssPuanHesaplama
//
//  Created by Furkan buğra karcı on 30.09.2024.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List(0 ..< 50) { item in
                    
                        Text("Hello, World!\(item)")
                    
                }
            }
            .navigationTitle("Geçmiş Hesaplamalar")
        }
    }
}

#Preview {
    ResultView()
}
