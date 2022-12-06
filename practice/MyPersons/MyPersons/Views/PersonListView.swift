//
//  PersonListView.swift
//  MyPersons
//
//  Created by Jongwook Park on 2022/11/30.
//

import SwiftUI

struct PersonListView: View {
    @ObservedObject var personStore: PersonStore = PersonStore()
    
    let urlString: String = "https://jsonplaceholder.typicode.com/users"
    
    func fetchData() {
        Task {
            let webService: WebService = WebService()
            let result: [Person] = try await webService.fetchData(url: urlString)
            personStore.persons = result
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(personStore.persons) { person in
                    NavigationLink {
                        PersonDetailView(person: person)
                    } label: {
                        LazyVStack {
                            HStack {
                                Text(person.name)
                                    .font(.headline)
                                Spacer()
                            }
                            HStack {
                                Text(person.username)
                                Spacer()
                            }
                            HStack {
                                Text(person.email)
                                Spacer()
                            }
                        }
                    }
                }
                Button {
                    fetchData()
                } label: {
                    Label("Reload", systemImage: "arrow.clockwise")
                        .padding()
                }
            }
            .navigationTitle("Persons")
            .onAppear {
                fetchData()
            }
        }
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView()
    }
}
