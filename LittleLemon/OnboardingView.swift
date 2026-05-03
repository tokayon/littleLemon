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
    @AppStorage("phone") private var phone = ""

    @State private var page = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                logo

                TabView(selection: $page) {
                    welcomePage.tag(0)
                    detailsPage.tag(1)
                    finalPage.tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))

                Button {
                    if page < 2 {
                        withAnimation { page += 1 }
                    } else {
                        isOnboardingCompleted = true
                    }
                } label: {
                    Text(page == 2 ? "Get started" : "Next")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LLTheme.yellow)
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal)
                .disabled(page == 1 && (firstName.isEmpty || email.isEmpty))
            }
            .padding(.vertical)
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

    private var welcomePage: some View {
        VStack(spacing: 20) {
            Text("Welcome to Little Lemon")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)

            Text("Fresh Mediterranean dishes delivered with a modern twist.")
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding()
    }

    private var detailsPage: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Tell us about yourself")
                .font(.title.bold())

            TextField("First name *", text: $firstName)
                .textFieldStyle(.roundedBorder)

            TextField("Last name", text: $lastName)
                .textFieldStyle(.roundedBorder)

            TextField("Email *", text: $email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .textFieldStyle(.roundedBorder)

            TextField("Phone number", text: $phone)
                .keyboardType(.phonePad)
                .textFieldStyle(.roundedBorder)

            Text("* Required fields")
                .font(.caption)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
    }

    private var finalPage: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(LLTheme.green)

            Text("You are ready to order")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)

            Text("Your profile details will be saved and available from the Profile screen.")
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
