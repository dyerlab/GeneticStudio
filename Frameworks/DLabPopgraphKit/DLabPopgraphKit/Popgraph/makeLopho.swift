//
//  makeLopho.swift
//  DLPopgraph
//
//  Created by Rodney Dyer on 6/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

func defaultGraph() -> Popgraph {
    
    
    let radii: [Double] = [7.4578942537271, 8.38564840703482, 17.4814077852324,
                            13.9608493006285, 6.38267718725335, 6.30359670547128,
                            12.2073836442719, 8.76782875524144, 11.3159511799494,
                            6.5605345754562, 8.56993864278869, 6.56831052000211,
                            5, 8.44982876540007, 10.6897661741224, 6.91258297698224,
                            13.7358126623227, 7.38152263325782, 8.17514808048328,
                            8.01607626417922, 7.14998264039569, 10.2456363875964,
                            5.22070436753603, 7.69312418487855, 10.3535432085044,
                            5.1339081801508, 8.90296295993226, 9.4661998657112,
                            13.1690196555877]
    
    let labels: [String] = ["Adygei", "Balochi", "BantuKenya",
                            "BantuSouthAfrica", "Basque",
                            "Bedouin", "BiakaPygmy", "Burusho",
                            "Cambodian", "Colombian", "Daur",
                            "Druze", "Kalash", "Lahu",
                            "Mandenka", "Maya", "MbutiPygmy",
                            "Melanesian", "Mongola", "Mozabite",
                            "Palestinian", "Papuan", "Pima",
                            "Russian", "San", "Uygur",
                            "Yakut", "Yi", "Yoruba"]
    
    let coord: [[CGFloat]] = [
        [ -0.6766739 , -0.8305067 , 1.450633 ],
        [ -0.5165526 , -0.9556498 , 0.4778811 ],
        [ 0.5869199 , 1.242157 , 1.015939 ],
        [ 1.521524 , 1.659686 , 0.5823476 ],
        [ -1.266483 , -0.918712 , 1.119679 ],
        [ 0.3073587 , -0.6322796 , 0.6480242 ],
        [ 1.141783 , 1.290574 , 0.5237307 ],
        [ -1.732257 , -0.4747673 , 1.355526 ],
        [ -0.204753 , 0.01207411 , -0.2547184 ],
        [ -0.001407471 , -0.1536686 , -2.006966 ],
        [ -0.1404645 , -0.7241208 , -1.744196 ],
        [ 0.3456565 , -1.032067 , -0.6118357 ],
        [ -1.101811 , -0.8531781 , -0.1180481 ],
        [ 0.3758893 , -0.2692374 , -0.8534264 ],
        [ 1.279122 , 1.92563 , 1.195418 ],
        [ 1.267557 , -0.3953014 , -1.61762 ],
        [ 1.817336 , 1.604236 , 0.07306017 ],
        [ -1.019375 , -0.1426054 , 0.2576206 ],
        [ -1.655719 , -0.3285117 , -0.7927815 ],
        [ -0.2792298 , -1.361604 , 0.649218 ],
        [ -0.6714447 , -1.520904 , 0.755737 ],
        [ 0.5278728 , 0.4712274 , 0.1141108 ],
        [ 0.9437909 , 0.6308882 , -0.8251938 ],
        [ -0.390731 , 0.1872318 , 0.817189 ],
        [ 1.180643 , 1.188513 , 0.004400439 ],
        [ -0.8091868 , -0.5951576 , 0.2113727 ],
        [ -1.131073 , -0.4480152 , -1.976813 ],
        [ -0.7226521 , -0.3322691 , -0.9684026 ],
        [ 1.024361 , 1.756339 , 0.5181143 ]
    ]
    
    
    let edges: [[String]] = [
        ["Adygei", "Balochi"],
        ["Adygei", "Basque"],
        ["Adygei", "Bedouin"],
        ["Adygei", "Burusho"],
        ["Adygei", "Mozabite"],
        ["Adygei", "Palestinian"],
        ["Adygei", "Russian"],
        ["Balochi", "Bedouin"],
        ["Balochi", "Druze"],
        ["Balochi", "Kalash"],
        ["Balochi", "Melanesian"],
        ["Balochi", "Mozabite"],
        ["BantuKenya", "BantuSouthAfrica"],
        ["BantuKenya", "BiakaPygmy"],
        ["BantuKenya", "Mandenka"],
        ["BantuKenya", "Russian"],
        ["BantuKenya", "Yoruba"],
        ["BantuSouthAfrica", "Mandenka"],
        ["BantuSouthAfrica", "MbutiPygmy"],
        ["BantuSouthAfrica", "San"],
        ["BantuSouthAfrica", "Yoruba"],
        ["Basque", "Burusho"],
        ["Basque", "Kalash"],
        ["Basque", "Mozabite"],
        ["Basque", "Palestinian"],
        ["Basque", "Russian"],
        ["Bedouin", "Druze"],
        ["Bedouin", "Palestinian"],
        ["Bedouin", "Papuan"],
        ["Bedouin", "Uygur"],
        ["BiakaPygmy", "Mandenka"],
        ["BiakaPygmy", "MbutiPygmy"],
        ["BiakaPygmy", "Papuan"],
        ["BiakaPygmy", "San"],
        ["BiakaPygmy", "Yoruba"],
        ["Burusho", "Melanesian"],
        ["Cambodian", "Kalash"],
        ["Cambodian", "Lahu"],
        ["Cambodian", "Melanesian"],
        ["Cambodian", "Papuan"],
        ["Cambodian", "Pima"],
        ["Cambodian", "Uygur"],
        ["Colombian", "Daur"],
        ["Colombian", "Maya"],
        ["Colombian", "Pima"],
        ["Colombian", "Yakut"],
        ["Colombian", "Yi"],
        ["Daur", "Druze"],
        ["Daur", "Lahu"],
        ["Daur", "Yakut"],
        ["Daur", "Yi"],
        ["Druze", "Lahu"],
        ["Druze", "Maya"],
        ["Druze", "Mozabite"],
        ["Druze", "Palestinian"],
        ["Kalash", "Palestinian"],
        ["Kalash", "Uygur"],
        ["Kalash", "Yi"],
        ["Lahu", "Papuan"],
        ["Lahu", "Yi"],
        ["Mandenka", "Yoruba"],
        ["Maya", "Pima"],
        ["MbutiPygmy", "San"],
        ["Melanesian", "Mongola"],
        ["Melanesian", "Papuan"],
        ["Mongola", "Uygur"],
        ["Mongola", "Yakut"],
        ["Mongola", "Yi"],
        ["Mozabite", "Palestinian"],
        ["Mozabite", "Uygur"],
        ["Papuan", "San"],
        ["Pima", "San"],
        ["Russian", "Uygur"],
        ["Russian", "Yi"],
        ["San", "Yoruba"],
        ["Yakut", "Yi"]
    ]
    
    let graph = Popgraph()
    
    for i in 0 ..< radii.count {
        let n = Node(label: labels[i], size: radii[i] )
        n.position = SCNVector3Make( coord[i][0], coord[i][1], coord[i][2] )
        graph.addNode( n )
    }
    
    for i in 0 ..< edges.count {
        graph.addEdge(from: edges[i][0],
                      to: edges[i][1],
                      weight: 1.0 ,
                      symmetric: true)
    }
    
    return graph
}
