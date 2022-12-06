//
//  ContentView.swift
//  MyPersons
//
//  Created by Jongwook Park on 2022/11/30.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var personStore: PersonStore = PersonStore()
    
    let urlString: String = "https://jsonplaceholder.typicode.com/users"
    
    func fetchData() {
        Task {
            let webService: WebService = WebService()
            let result: [Person] = try await webService.fetchData(url: urlString)
            personStore.persons = result
        }
    }
    
    @State private var selectedPersonID: Person.ID?
    
    var selectedPerson: Person? {
        get {
            for person in personStore.persons {
                if person.id == selectedPersonID {
                    return person
                }
            }
            return nil
        }
    }
    
    
    var body: some View {
        
        NavigationSplitView {
            List(personStore.persons, selection: $selectedPersonID) { person in
                Text(person.name)
            }
        } detail: {
            if let selectedPerson {
                PersonDetailView(person: selectedPerson)
            } else {
                Text("Select a person")
            }
        }
        .onAppear {
            fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
