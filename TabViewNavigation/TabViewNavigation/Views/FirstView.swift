//
//  FirstView.swift
//  TabViewNavigation
//
//  Created by Bengi Anıl on 10.11.2024.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationLink(value: "detail") {
            Text("Detail View")
        }
        .navigationDestination(for: String.self) { value in
            if value == "detail" {
                DetailView()
            }
        }
    }
}

#Preview {
    FirstView()
}
