//
//  AppAvatarView.swift
//  Buildio
//
//  Created by Sergey Khliustin on 04.11.2021.
//

import SwiftUI
import Models

struct AppAvatarView: BaseView {
    @StateObject var model: AppAvatarViewModel
    
    init(app: V0AppResponseItemModel) {
        self._model = StateObject(wrappedValue: AppAvatarViewModel(app: app))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)
            HStack(spacing: 0) {
                Spacer(minLength: 0)
                switch model.state {
                case .value:
                    if let value = model.value {
                        Image(uiImage: value)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        EmptyView()
                    }
                    
                case .loading:
                    ProgressView()
                case .error, .idle:
                    Text(model.name)
                        .foregroundColor(.white)
                }
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
        }
        .background(model.backgroundColor)
        
    }
}

struct ImageURL_Previews: PreviewProvider {
    static var previews: some View {
        AppAvatarView(app: V0AppResponseItemModel.preview())
            .frame(width: 40, height: 40)
    }
}
