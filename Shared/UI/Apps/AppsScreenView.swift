//
//  AppsScreenView.swift
//  Buildio
//
//  Created by Sergey Khliustin on 28.10.2021.
//

import SwiftUI
import Models

struct AppsScreenView: View, PagingView, AppMultiRouteView {
    let router: AppRouter
    @State var activeRoute: AppRoute?
    
    private var completion: ((V0AppResponseItemModel) -> Void)?
    
    init(router: AppRouter = AppRouter(), completion: ((V0AppResponseItemModel) -> Void)? = nil) {
        self.router = router
        self.completion = completion
    }
    
    @StateObject var model = AppsViewModel()
    @State var selected: V0AppResponseItemModel?
    
    func buildItemView(_ item: V0AppResponseItemModel) -> some View {
        ListItemWrapper(cornerRadius: 8, action: {
            if let completion = completion {
                completion(item)
            } else {
                activeRoute = .buildsScreen(item)
            }
        }, content: {
            AppRowView(model: item)
        })
    }
    
    @ViewBuilder
    func navigationLinks() -> some View {
        if completion == nil {
            ForEach(model.items) { item in
                router.navigationLink(route: .buildsScreen(item), selection: $activeRoute)
                    .hidden()
            }
        }
    }
    
    @ViewBuilder
    func additionalToolbarItems() -> some View {
        
    }
}

struct AppsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AppsScreenView()
    }
}
