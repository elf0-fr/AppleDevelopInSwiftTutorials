//
//  PickAPallContentView.swift
//  AppleDevelopInSwiftTutorials
//
//  Created by Elfo on 07/04/2024.
//

import SwiftUI
import SwiftData

struct PickAPallContentView: View {
    @Query(sort: \Pal.name) private var pals: [Pal]
    @Query private var friends: [Friend]
    @Environment(\.modelContext) var modelContext
    
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickName = false
    
    var searchResults: [String] {
        if nameToAdd.isEmpty {
            return []
        }
        else {
            return friends
                .filter { $0.name.contains(nameToAdd) }
                .map { $0.name }
        }
    }
    
    var body: some View {
        VStack {
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            Group {
                if !pals.isEmpty {
                    List {
                        ForEach(pals) { pal in
                            Text(pal.name)
                        }
                        .onDelete(perform: deletePals)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                } else {
                    ContentUnavailableView {
                        Label("No pals", systemImage: "person.3")
                    }
                }
            }
            .searchable(text: $nameToAdd, prompt: "Add an item") {
                ForEach(searchResults, id: \.self) { result in
                    Text("Pick \(result)")
                        .searchCompletion(result)
                }
            }
            .autocorrectionDisabled()
            .onSubmit(of: .search, submitSearch)
            
            Button(action: pickRandomItem) {
                Text("Pick Random Item")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        .safeAreaInset(edge: .top) {
            PickAPalHeader()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Toggle(
                        "Remove when picked",
                        isOn: $shouldRemovePickName
                    )
                } label: {
                    Label("Menu", systemImage: "ellipsis.circle")
                }

            }
        }
    }
    
    private func containPal(palName: String) -> Bool {
        pals.contains { pal in
            pal.name == palName
        }
    }
    
    private func addPal(_ pal: Pal) {
        withAnimation {
            modelContext.insert(pal)
        }
    }
    
    private func deletePals(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(pals[index])
            }
        }
    }
    
    private func submitSearch() {
        guard !nameToAdd.isEmpty && !containPal(palName: nameToAdd) else {
            return
        }
        
        nameToAdd = nameToAdd.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        addPal(Pal(name: nameToAdd))
        nameToAdd = ""
    }
    
    private func pickRandomItem() {
        guard let randomPal = pals.randomElement() else {
            pickedName = ""
            return
        }
        
        pickedName = randomPal.name
        if shouldRemovePickName {
            modelContext.delete(randomPal)
        }
    }
}

#Preview {
    NavigationStack {
        PickAPallContentView()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("No Model") {
    NavigationStack {
        PickAPallContentView()
            .modelContainer(for: models, inMemory: true)
    }
}

struct PickAPalHeader: View {
    var body: some View {
        VStack {
            Image(systemName: "person.3.sequence.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 40)
                .foregroundStyle(.tint)
                .symbolRenderingMode(.hierarchical)
            Text("Pick-a-pall")
//                .foregroundStyle(.white)
        }
        .font(.largeTitle.lowercaseSmallCaps())
        .bold()
    }
}
