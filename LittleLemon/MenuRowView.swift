//
//  MenuRowView.swift
//  LittleLemon
//
//  Created by Serge Sinkevych on 5/3/26.
//

import Foundation
import SwiftUI

struct MenuRowView: View {
    let item: MenuItem

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.black)

                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                Text(item.price)
                    .font(.headline)
                    .foregroundColor(LLTheme.green)
            }

            Spacer()

            RoundedRectangle(cornerRadius: 8)
                .fill(LLTheme.lightGray)
                .overlay {
                    Image(systemName: item.imageName)
                        .font(.system(size: 34))
                        .foregroundColor(LLTheme.green)
                }
                .frame(width: 90, height: 90)
        }
        .padding(.vertical, 18)
    }
}
