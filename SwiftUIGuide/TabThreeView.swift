//
//  TabThreeView.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/13.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
}

struct PersonView: View {
    var person: Person
    
    var body: some View {
        Text(person.name).bold().foregroundColor(.red)
    }
    
    
}

class TabThreeViewModel: ObservableObject {
    var names = ["Alex", "Rob", "Matthew", "Chris"]
    @Published var people: [Person] = []
    
    func delete(at indexes: IndexSet) {
        if let first = indexes.first {
            people.removeFirst()
        }
    }
}

struct TabThreeView: View {
    @StateObject var viewModel = TabThreeViewModel()
    
    
    var body: some View {
        VStack {
            Button(action: {
                let newPerson = Person(name: viewModel.names.randomElement() ?? "Alex")
                viewModel.people.append(newPerson)
            }, label: {
                Text("Add new person")
            })
            
//            List {
//                Text("Alex")
//                Image(systemName: "heart")
//            }
            
//            List(viewModel.names, id: \.self) { name in
//                Text(name).bold()
//            }
//
           
//            List(viewModel.people) { person in
//                PeopleView(person: person)
//            }
            
//            List {
//                Section(header: Text("People")) {
//                    ForEach(viewModel.people) { person in
//                        PersonView(person: person)
//                    }.onDelete(perform: { indexSet in
//                        viewModel.delete(at: indexSet)
//                    })
//                }
//            }
            
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.people) { person in
                            PersonView(person: person)
                                .onTapGesture {
                                    print(person)
                                }
                        }
                    }
                }
            }
        }
    }
}

struct TabThreeView_Previews: PreviewProvider {
    static var previews: some View {
        TabThreeView()
    }
}
