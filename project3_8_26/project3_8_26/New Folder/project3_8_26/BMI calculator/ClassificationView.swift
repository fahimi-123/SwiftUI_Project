//
//  ClassificationView.swift
//  project3_8_26
//
//  Created by STDC_45 on 06/08/2026.
//

import SwiftUI

struct ClassificationView: View {
    @Binding var classString: String
    var body: some View {
        Text(classString)
            .font(.title2)
    }
}

#Preview {
    ClassificationView(classString: .constant("Normal"))
}
