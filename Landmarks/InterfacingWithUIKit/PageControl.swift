//
//  PageControl.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 09.11.2022.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
        
    @Binding var currentPage: Int
    var numberOfPages: Int

    
    func makeUIView(context: Context) -> some UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.currentPage = currentPage
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(control: self)
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(control: PageControl) {
            self.control = control
        }
        
        //Поскольку подклассы UIControl, такие как UIPageControl, используют шаблон действия цели вместо делегирования, этот координатор реализует метод @objc для обновления текущей привязки страницы.
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
}


