//
//  OnboardingView.swift
//  LittleLemon
//
//  Created by Serge Sinkevych on 5/3/26.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboardingCompleted") private var isOnboardingCompleted = false
    @AppStorage("firstName") private var firstName = ""
    @AppStorage("lastName") private var lastName = ""
    @AppStorage("email") private var email = ""

    @State private var page = 0

    private var isCurrentPageValid: Bool {
        switch page {
        case 0:
            return !firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        case 1:
            return !lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        case 2:
            return !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        default:
            return false
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                logo

                Spacer()

                onboardingPage

                Spacer()

                Button {
                    if page < 2 {
                        withAnimation {
                            page += 1
                        }
                    } else {
                        isOnboardingCompleted = true
                    }
                } label: {
                    Text(page == 2 ? "Get started" : "Next")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isCurrentPageValid ? LLTheme.yellow : Color.gray.opacity(0.3))
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .disabled(!isCurrentPageValid)
                .padding(.horizontal)

                pageIndicator
            }
            .padding(.vertical)
            .navigationBarHidden(true)
        }
    }

    private var logo: some View {
        HStack(spacing: 8) {
            Image(systemName: "leaf.fill")
                .foregroundColor(LLTheme.yellow)

            Text("LITTLE LEMON")
                .tracking(3)
                .font(.headline)
                .foregroundColor(LLTheme.green)
        }
        .padding(.top, 24)
    }

    @ViewBuilder
    private var onboardingPage: some View {
        switch page {
        case 0:
            inputPage(
                title: "What is your first name?",
                subtitle: "Please enter your first name to continue.",
                placeholder: "First name",
                text: $firstName,
                keyboardType: .default,
                autocapitalization: .words
            )

        case 1:
            inputPage(
                title: "What is your last name?",
                subtitle: "Please enter your last name.",
                placeholder: "Last name",
                text: $lastName,
                keyboardType: .default,
                autocapitalization: .words
            )

        case 2:
            inputPage(
                title: "What is your email address?",
                subtitle: "We will use this for your Little Lemon profile.",
                placeholder: "Email address",
                text: $email,
                keyboardType: .emailAddress,
                autocapitalization: .never
            )

        default:
            EmptyView()
        }
    }

    private func inputPage(
        title: String,
        subtitle: String,
        placeholder: String,
        text: Binding<String>,
        keyboardType: UIKeyboardType,
        autocapitalization: TextInputAutocapitalization
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.largeTitle.bold())
                .foregroundColor(LLTheme.green)

            Text(subtitle)
                .font(.title3)
                .foregroundColor(.secondary)

            TextField(placeholder, text: text)
                .keyboardType(keyboardType)
                .textInputAutocapitalization(autocapitalization)
                .autocorrectionDisabled()
                .textFieldStyle(.roundedBorder)
                .font(.title3)
        }
        .padding(.horizontal)
    }

    private var pageIndicator: some View {
        HStack(spacing: 8) {
            ForEach(0..<3, id: \.self) { index in
                Circle()
                    .fill(index == page ? LLTheme.green : Color.gray.opacity(0.3))
                    .frame(width: 10, height: 10)
            }
        }
        .padding(.bottom, 12)
    }
}
