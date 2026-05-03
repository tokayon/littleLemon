//
//  HomeView.swift
//  LittleLemon
//
//  Created by Serge Sinkevych on 5/3/26.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var selectedCategory: String? = nil

    private let categories = ["Starters", "Mains", "Desserts", "Drinks"]

    private var filteredItems: [MenuItem] {
        menuItems.filter { item in
            let matchesCategory = selectedCategory == nil || item.category == selectedCategory
            let matchesSearch = searchText.isEmpty ||
                item.title.localizedCaseInsensitiveContains(searchText) ||
                item.description.localizedCaseInsensitiveContains(searchText)
            return matchesCategory && matchesSearch
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    header
                    hero
                    menuBreakdown
                    menuList
                }
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
        }
    }

    private var header: some View {
        HStack {
            Spacer()

            HStack(spacing: 8) {
                Image(systemName: "leaf.fill")
                    .foregroundColor(LLTheme.yellow)
                    .font(.title)
                Text("LITTLE LEMON")
                    .font(.headline)
                    .tracking(3)
                    .foregroundColor(LLTheme.green)
            }

            Spacer()

            NavigationLink {
                ProfileView()
            } label: {
                Image(systemName: "person.crop.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(LLTheme.green)
            }
        }
        .padding(.top, 60)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        .background(Color.white)
    }

    private var hero: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Little Lemon")
                        .font(.system(size: 44, weight: .bold, design: .serif))
                        .foregroundColor(LLTheme.yellow)

                    Text("Chicago")
                        .font(.system(size: 28, weight: .semibold, design: .serif))
                        .foregroundColor(.white)

                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(.body)
                        .foregroundColor(.white)
                        .lineSpacing(3)
                }

                Spacer()

                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.black.opacity(0.2))
                    .overlay {
                        Image(systemName: "fork.knife.circle.fill")
                            .font(.system(size: 70))
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .frame(width: 140, height: 130)
            }

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)

                TextField("Search menu", text: $searchText)
                    .textInputAutocapitalization(.never)
            }
            .padding()
            .background(LLTheme.lightGray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .padding(20)
        .background(LLTheme.green)
    }

    private var menuBreakdown: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("ORDER FOR DELIVERY!")
                .font(.title3)
                .fontWeight(.black)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    categoryButton(title: "All", isSelected: selectedCategory == nil) {
                        selectedCategory = nil
                    }

                    ForEach(categories, id: \.self) { category in
                        categoryButton(title: category, isSelected: selectedCategory == category) {
                            selectedCategory = category
                        }
                    }
                }
            }
        }
        .padding(20)
        .background(Color.white)
    }

    private func categoryButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline.bold())
                .foregroundColor(LLTheme.green)
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .background(isSelected ? LLTheme.yellow.opacity(0.9) : LLTheme.lightGray)
                .clipShape(Capsule())
        }
    }

    private var menuList: some View {
        VStack(spacing: 0) {
            Divider()

            ForEach(filteredItems) { item in
                MenuRowView(item: item)
                Divider()
            }
        }
        .padding(.horizontal, 20)
        .background(Color.white)
    }
}
