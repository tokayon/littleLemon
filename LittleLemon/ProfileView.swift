//
//  ProfileView.swift
//  LittleLemon
//
//  Created by Serge Sinkevych on 5/3/26.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss

    @AppStorage("isOnboardingCompleted") private var isOnboardingCompleted = false
    @AppStorage("firstName") private var firstName = ""
    @AppStorage("lastName") private var lastName = ""
    @AppStorage("email") private var email = ""
    @AppStorage("phone") private var phone = ""

    @AppStorage("orderStatuses") private var orderStatuses = true
    @AppStorage("passwordChanges") private var passwordChanges = true
    @AppStorage("specialOffers") private var specialOffers = true
    @AppStorage("newsletter") private var newsletter = true

    var body: some View {
        Form {
            Section("Personal information") {
                HStack(spacing: 16) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 64))
                        .foregroundColor(LLTheme.green)

                    Button("Change") {}
                        .buttonStyle(.borderedProminent)
                        .tint(LLTheme.green)

                    Button("Remove") {}
                        .buttonStyle(.bordered)
                }
                .padding(.vertical, 8)

                TextField("First name", text: $firstName)
                TextField("Last name", text: $lastName)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                TextField("Phone number", text: $phone)
                    .keyboardType(.phonePad)
            }

            Section("Email notifications") {
                Toggle("Order statuses", isOn: $orderStatuses)
                Toggle("Password changes", isOn: $passwordChanges)
                Toggle("Special offers", isOn: $specialOffers)
                Toggle("Newsletter", isOn: $newsletter)
            }

            Section {
                Button(role: .destructive) {
                    logOut()
                } label: {
                    Text("Log out")
                        .frame(maxWidth: .infinity)
                }

                Button {
                    dismiss()
                } label: {
                    Text("Save changes")
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func logOut() {
        firstName = ""
        lastName = ""
        email = ""
        phone = ""
        orderStatuses = false
        passwordChanges = false
        specialOffers = false
        newsletter = false
        isOnboardingCompleted = false
    }
}
