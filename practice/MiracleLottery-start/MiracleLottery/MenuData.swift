//
//  MenuData.swift
//  MiracleLottery
//
//  Created by 김예원 on 2022/10/24.
//

import Foundation
import Combine

class MenuData : ObservableObject {
    // 5개 불러옴 순서대로 나옴 분리 ㄴㄴ 한 곳 배열 한개로 만들자..?!!
    // 결과창에서
    //"아직 메뉴를 고르지 않았습니다."
    @Published var menuResultList : [String] = []
    @Published var lunchMenus: [String] = ["부대찌개", "돈까스", "불백", "김치찜", "마카롱", "육개장", "짜장면", "초밥", "스파게티", "삼겹살"]
    
    //메뉴 보드
    @Published var userNumber: Int = 10
    @Published var rotation: Int = 0
    @Published var titleTextOpacity: CGFloat = 0.0
    @Published var resultTextOpacity: CGFloat = 0.0
    
    func resetData(){
        userNumber = 10
        rotation = 0
        titleTextOpacity = 0.0
        resultTextOpacity = 0.0
    }
    
    func menuResultListUpdate(menuName:String){
        self.menuResultList.append(menuName)
    }
    
    func getCurrentIndex() -> Int {
        
        //돌아가는 각도의 범위가 3600까지 이므로 % 360 으로 회전각도를 구하고
        //270도에서 빼줘서 화살표가 가르키는곳의 각도를 구한다.
        var offsetRotation: Int = 270 - self.rotation % 360
        
        //이때 마이너스인 경우에는 360도에서 빼줘서 그 각도를 구한다
        if offsetRotation < 0 {
            offsetRotation = 360 + offsetRotation
        }
        
        var index: Int = 0
        
        //돌아간 각도에서 조각의 각도만큼 반복적으로 빼주어 화살표가 가르키는 인덱스가 몇 번째인지 구한다.
        while offsetRotation > 0 {
            index += 1
            offsetRotation -= Int(360/self.userNumber)
        }
        //구한 값에서 1을 빼준다(배열에 접근하기 위해)
        return (index - 1)
    }

}

