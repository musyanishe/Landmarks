//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 08.11.2022.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.default
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                
                if editMode?.wrappedValue == .active {
                    Button("Cancell", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
             //сохраняем изменения, которые внес пользователь
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
        //Несмотря на то, что в этом представлении не используется свойство с атрибутом @EnvironmentObject, ProfileSummary, дочерний элемент этого представления, делает это. Таким образом, без модификатора предварительный просмотр крашится.
    }
}

//Добавьте свойство представления среды, которое отключается от \.editMode среды. SwiftUI предоставляет хранилище в среде для значений, к которым вы можете получить доступ с помощью обертки свойств @Environment. Получите доступ к значению editMode для чтения или записи области редактирования.
