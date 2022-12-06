//
//  PersonDetailView.swift
//  MyPersons
//
//  Created by Jongwook Park on 2022/11/30.
//

import SwiftUI
import MapKit

struct PersonDetailView: View {
    let person: Person?
    
    var geoLat: CLLocationDegrees = 34.011_286
    var geoLng: CLLocationDegrees = -116.166_868
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: Double(person?.address.geo.lat ?? "0") ?? geoLat,
            longitude: Double(person?.address.geo.lng ?? "0") ?? geoLng
        )
    }
    
    var body: some View {
        Form {
            Section(header: Text("Info")) {
                VStack(alignment: .leading) {
                    Text("name")
                        .bold()
                    Text(person?.name ?? "")
                }
                VStack(alignment: .leading) {
                    Text("email")
                        .bold()
                    Text(person?.email ?? "")
                }
                VStack(alignment: .leading) {
                    Text("username")
                        .bold()
                    Text(person?.username ?? "")
                }
                VStack(alignment: .leading) {
                    Text("phone")
                        .bold()
                    Text(person?.phone ?? "")
                }
                VStack(alignment: .leading) {
                    Text("website")
                        .bold()
                    Text(person?.website ?? "")
                }
            }
            
            Section(header: Text("Address")) {
                VStack(alignment: .leading) {
                    Text(person?.address.street ?? "")
                    Text(person?.address.suite ?? "")
                    Text(person?.address.city ?? "")
                    Text(person?.address.zipcode ?? "")
                }
                
                MapView(coordinate: locationCoordinates)
                    .frame(height: 350)
            }
            
            Section(header: Text("Company")) {
                VStack(alignment: .leading) {
                    Text("name")
                        .bold()
                    Text(person?.company.name ?? "")
                }
                VStack(alignment: .leading) {
                    Text("catch phrase")
                        .bold()
                    Text(person?.company.catchPhrase ?? "")
                }
                VStack(alignment: .leading) {
                    Text("bs")
                        .bold()
                    Text(person?.company.bs ?? "")
                }
            }
            
        }
        .navigationTitle(person?.name ?? "")
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PersonDetailView(
                person: Person(
                    id: 123,
                    name: "Ned",
                    username: "nedpark",
                    email: "ned@ned.com",
                    address: Address(street: "street", suite: "suite", city: "city", zipcode: "12345", geo: Geo(lat: "0.0", lng: "0.0")),
                    phone: "010-0000-1111",
                    website: "unkown",
                    company: Company(name: "likelion", catchPhrase: "catchPhrase", bs: "bs")))
        }
    }
}
