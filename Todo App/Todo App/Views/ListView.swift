import SwiftUI

struct ListView: View {
   
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
            }
            List {
                ForEach(listViewModel.items) { item in
                    TodoItemView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                self.listViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.delete)
                .onMove(perform: listViewModel.moveItem)
            }
        }
        
        .listStyle(PlainListStyle())
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddItemView())
            }
        }
        .navigationTitle("Todo List 📋")
    }
    
   
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}
