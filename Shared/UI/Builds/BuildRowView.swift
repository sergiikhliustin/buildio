//
//  BuildRowView.swift
//  Buildio
//
//  Created by Sergey Khliustin on 21.10.2021.
//

import SwiftUI
import Models

struct BuildRowView: View {
    @Binding var model: BuildResponseItemModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            let statusColor = model.status.color
            Rectangle()
                .fill(statusColor)
                .frame(width: 5)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center) {
                    AppAvatarView(app: model.repository)
                        .frame(width: 40, height: 40)
                        .cornerRadius(8)
                        .font(.title2)
                    
                    VStack(alignment: .leading) {
                        Text(model.repository.title)
                        HStack(spacing: 0) {
                            Text(model.commitMessage ?? "No commit message")
                            if let tag = model.tag {
                                Text(tag)
                                    .padding(2)
                                    .background(Color.b_BorderLight)
                            }
                        }
                    }
                    Spacer()
                    if let duration = model.durationString {
                        Text(duration)
                    }
                }
                .lineLimit(1)
                .padding(8)
                Rectangle().fill(Color.b_BorderLight)
                    .frame(height: 1)
                HStack(spacing: 0) {
                    Text(model.branchUIString)
                        .padding(8)
                        .foregroundColor(model.status.color)
                        .background(model.status.colorLight)
                    if let pullRequestId = model.pullRequestId, pullRequestId != 0 {
                        Text(String(pullRequestId))
                            .padding(8)
                    } else if let commitHash = model.commitHash {
                        Text(String(commitHash.suffix(7)))
                            .padding(8)
                    }
                    Spacer(minLength: 0)
                    if let cost = model.creditCost {
                        Text(String(cost))
                            .padding(8)
                    }
                    Text(model.triggeredWorkflow)
                        .padding(8)
                    Text("# \(String(model.buildNumber))")
                        .padding(8)
                }
            }
            
        }
        .cornerRadius(8)
        .font(.footnote)
        .multilineTextAlignment(.leading)
        .foregroundColor(.b_TextBlack)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .shadow(radius: 5)
        )
        
    }
}

struct BuildRowView_Previews: PreviewProvider {
    static var previews: some View {
        BuildRowView(model: .constant(BuildResponseItemModel.preview()))
            .preferredColorScheme(.light)
            .padding(8)
            
    }
}
