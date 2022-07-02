//
//  RoutingStuff.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/20/21.
//

import Foundation
import SwiftUI

let buttermilkAdjacencyList = AdjacencyList<String>()

//key:
//0 = lift, 1 = beginner, 2 = intermediate, 3 = expert

let TiehackExpressTop = buttermilkAdjacencyList.createVertex(data: "Tiehack Express Top", level: 0)
let TiehackExpressBottom = buttermilkAdjacencyList.createVertex(data: "Tiehack Express Bottom", level: 0)
let SummitExpressTop = buttermilkAdjacencyList.createVertex(data: "Summit Express Top", level: 0)
let SummitExpressBottom = buttermilkAdjacencyList.createVertex(data: "Summit Express Bottom", level: 0)
let WestButtermilkExpressTop = buttermilkAdjacencyList.createVertex(data: "West Buttermilk Express Top", level: 0)
let WestButtermilkExpressBottom = buttermilkAdjacencyList.createVertex(data: "West Buttermilk Express Bottom", level: 0)
let TiehackParkway = buttermilkAdjacencyList.createVertex(data: "Tiehack Parkway", level: 3)
let RacersEdge = buttermilkAdjacencyList.createVertex(data: "Racers Edge", level: 3)
let Javelin = buttermilkAdjacencyList.createVertex(data: "Javelin", level: 3)
let TimberDoodleGlade = buttermilkAdjacencyList.createVertex(data: "Timber Doodle Glade", level: 3)
let TiehackTrail = buttermilkAdjacencyList.createVertex(data: "Tiehack Trail", level: 3)
let Sterner = buttermilkAdjacencyList.createVertex(data: "Sterner", level: 3)
let SternerGulch = buttermilkAdjacencyList.createVertex(data: "Sterner Gulch", level: 2)
let Ptarmigan = buttermilkAdjacencyList.createVertex(data: "Ptarmigan", level: 2)
let MagicCarpet = buttermilkAdjacencyList.createVertex(data: "Magic Carpet", level: 2)
let Buckskin = buttermilkAdjacencyList.createVertex(data: "Buckskin", level: 2)
let SternerCatwalk = buttermilkAdjacencyList.createVertex(data: "Sterner Catwalk", level: 1)
let Savio = buttermilkAdjacencyList.createVertex(data: "Savio", level: 2)
let Friedls = buttermilkAdjacencyList.createVertex(data: "Friedls", level: 2)
let NoProblem = buttermilkAdjacencyList.createVertex(data: "No Problem", level: 2)
let LoversLane = buttermilkAdjacencyList.createVertex(data: "Lovers Lane", level: 2)
let Bear = buttermilkAdjacencyList.createVertex(data: "Bear", level: 2)
let MidwayAvenue = buttermilkAdjacencyList.createVertex(data: "Midway Avenue", level: 2)
let Columbine = buttermilkAdjacencyList.createVertex(data: "Columbine", level: 2)
let TomsThumb = buttermilkAdjacencyList.createVertex(data: "Toms Thumb", level: 1)
let RedsRover = buttermilkAdjacencyList.createVertex(data: "Reds Rover", level: 1)
let Larkspur = buttermilkAdjacencyList.createVertex(data: "Larkspur", level: 1)
let BigFaceHollow = buttermilkAdjacencyList.createVertex(data: "Big Face Hollow", level: 2)
let CampBird = buttermilkAdjacencyList.createVertex(data: "Campbird", level: 2)
let Teaser = buttermilkAdjacencyList.createVertex(data: "Teaser", level: 2)
let WestwardHo = buttermilkAdjacencyList.createVertex(data: "Westward Ho", level: 2)

func createList() {
    buttermilkAdjacencyList.vertextList.append(TiehackExpressTop)
    buttermilkAdjacencyList.vertextList.append(TiehackExpressBottom)
    buttermilkAdjacencyList.vertextList.append(SummitExpressTop)
    buttermilkAdjacencyList.vertextList.append(SummitExpressBottom)
    buttermilkAdjacencyList.vertextList.append(WestButtermilkExpressTop)
    buttermilkAdjacencyList.vertextList.append(WestButtermilkExpressBottom)
    buttermilkAdjacencyList.vertextList.append(TiehackParkway)
    buttermilkAdjacencyList.vertextList.append(RacersEdge)
    buttermilkAdjacencyList.vertextList.append(Javelin)
    buttermilkAdjacencyList.vertextList.append(TimberDoodleGlade)
    buttermilkAdjacencyList.vertextList.append(TiehackTrail)
    buttermilkAdjacencyList.vertextList.append(Sterner)
    buttermilkAdjacencyList.vertextList.append(SternerGulch)
    buttermilkAdjacencyList.vertextList.append(Ptarmigan)
    buttermilkAdjacencyList.vertextList.append(MagicCarpet)
    buttermilkAdjacencyList.vertextList.append(Buckskin)
    buttermilkAdjacencyList.vertextList.append(SternerCatwalk)
    buttermilkAdjacencyList.vertextList.append(Savio)
    buttermilkAdjacencyList.vertextList.append(Friedls)
    buttermilkAdjacencyList.vertextList.append(NoProblem)
    buttermilkAdjacencyList.vertextList.append(LoversLane)
    buttermilkAdjacencyList.vertextList.append(Bear)
    buttermilkAdjacencyList.vertextList.append(MidwayAvenue)
    buttermilkAdjacencyList.vertextList.append(Columbine)
    buttermilkAdjacencyList.vertextList.append(TomsThumb)
    buttermilkAdjacencyList.vertextList.append(RedsRover)
    buttermilkAdjacencyList.vertextList.append(Larkspur)
    buttermilkAdjacencyList.vertextList.append(BigFaceHollow)
    buttermilkAdjacencyList.vertextList.append(CampBird)
    buttermilkAdjacencyList.vertextList.append(Teaser)
    buttermilkAdjacencyList.vertextList.append(WestwardHo)
}


func createEdges(){
    buttermilkAdjacencyList.add(.directed, from: TiehackExpressBottom, to: TiehackExpressTop, weight: 1000)
    buttermilkAdjacencyList.add(.directed, from: SummitExpressBottom, to: SummitExpressTop, weight: 1200)
    buttermilkAdjacencyList.add(.directed, from: WestButtermilkExpressBottom, to: WestButtermilkExpressTop, weight: 800)
    buttermilkAdjacencyList.add(.directed, from: TiehackExpressTop, to: TiehackParkway, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: TiehackParkway, to: RacersEdge, weight: 400)
    buttermilkAdjacencyList.add(.directed, from: TiehackParkway, to: Javelin, weight: 350)
    buttermilkAdjacencyList.add(.directed, from: TiehackParkway, to: TiehackTrail, weight: 300)
    buttermilkAdjacencyList.add(.directed, from: TiehackParkway, to: TimberDoodleGlade, weight: 250)
    buttermilkAdjacencyList.add(.directed, from: TiehackParkway, to: Sterner, weight: 200)
    buttermilkAdjacencyList.add(.directed, from: RacersEdge, to: TiehackExpressBottom, weight: 250)
    buttermilkAdjacencyList.add(.directed, from: Javelin, to: TiehackExpressBottom, weight: 300)
    buttermilkAdjacencyList.add(.directed, from: TiehackTrail, to: TiehackExpressBottom, weight: 350)
    buttermilkAdjacencyList.add(.directed, from: TimberDoodleGlade, to: SternerGulch, weight: 150)
    buttermilkAdjacencyList.add(.directed, from: Sterner, to: SternerGulch, weight: 100)
    buttermilkAdjacencyList.add(.directed, from: SternerGulch, to: TiehackExpressBottom, weight: 500)
    buttermilkAdjacencyList.add(.directed, from: TiehackExpressTop, to: Ptarmigan, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: Ptarmigan, to: SternerGulch, weight: 150)
    buttermilkAdjacencyList.add(.directed, from: Ptarmigan, to: Buckskin, weight: 30)
    buttermilkAdjacencyList.add(.directed, from: Buckskin, to: MagicCarpet, weight: 300)
    buttermilkAdjacencyList.add(.directed, from: Buckskin, to: SternerCatwalk, weight: 150)
    buttermilkAdjacencyList.add(.directed, from: MagicCarpet, to: TiehackExpressBottom, weight: 300)
    buttermilkAdjacencyList.add(.directed, from: Ptarmigan, to: SternerGulch, weight: 150)
    buttermilkAdjacencyList.add(.directed, from: SternerCatwalk, to: SummitExpressBottom, weight: 700)
    buttermilkAdjacencyList.add(.directed, from: SummitExpressTop, to: Savio, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: SummitExpressTop, to: WestwardHo, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: SummitExpressTop, to: Friedls, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: Friedls, to: NoProblem, weight: 30)
    buttermilkAdjacencyList.add(.directed, from: NoProblem, to: LoversLane, weight: 40)
    buttermilkAdjacencyList.add(.directed, from: Savio, to: LoversLane, weight: 50)
    buttermilkAdjacencyList.add(.directed, from: LoversLane, to: MidwayAvenue, weight: 50)
    buttermilkAdjacencyList.add(.directed, from: MidwayAvenue, to: SummitExpressBottom, weight: 800)
    buttermilkAdjacencyList.add(.directed, from: LoversLane, to: Bear, weight: 80)
    buttermilkAdjacencyList.add(.directed, from: Bear, to: Columbine, weight: 300)
    buttermilkAdjacencyList.add(.directed, from: Columbine, to: SummitExpressBottom, weight: 600)
    buttermilkAdjacencyList.add(.directed, from: WestButtermilkExpressTop, to: TomsThumb, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: TomsThumb, to: SummitExpressTop, weight: 100)
    buttermilkAdjacencyList.add(.directed, from: WestButtermilkExpressTop, to: RedsRover, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: RedsRover, to: WestButtermilkExpressBottom, weight: 300)
    buttermilkAdjacencyList.add(.directed, from: WestButtermilkExpressTop, to: Larkspur, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: Larkspur, to: WestButtermilkExpressBottom, weight: 220)
    buttermilkAdjacencyList.add(.directed, from: WestButtermilkExpressTop, to: BigFaceHollow, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: BigFaceHollow, to: WestButtermilkExpressBottom, weight: 220)
    buttermilkAdjacencyList.add(.directed, from: WestButtermilkExpressTop, to: CampBird, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: CampBird, to: WestButtermilkExpressBottom, weight: 300)
    buttermilkAdjacencyList.add(.directed, from: BigFaceHollow, to: Teaser, weight: 200)
    buttermilkAdjacencyList.add(.directed, from: Teaser, to: WestButtermilkExpressBottom, weight: 100)
    buttermilkAdjacencyList.add(.directed, from: WestButtermilkExpressTop, to: WestwardHo, weight: 0)
    buttermilkAdjacencyList.add(.directed, from: WestwardHo, to: WestButtermilkExpressBottom, weight: 350)
}

func getPoint(name: String) -> Int? {
    let list = buttermilkAdjacencyList.vertextList
    for i in 0..<list.count {
        if list[i].data == name {
            print(list[i])
            return i
        }
    }
    return nil
}

//func getPath(start: String, end: String) -> [Vertex<String>] {
//    createEdges()
//    var steps = [Vertex<String>]()
//
//    let startPoint = getStartPoint(start: start)!
//    let endPoint = getEndPoint(end: end)!
//
//    if let edges = buttermilkAdjacencyList.findPath(from: startPoint, to: endPoint) {
//      for edge in edges {
//        steps.append(edge.target)
//      }
//   }
//    return steps
//}

//func getAllPaths(sample: routeSample) -> [[Vertex<String>]] {
//    createEdges()
//    let routes = buttermilkAdjacencyList.findAllPaths(from: getStartPoint(sample: sample), to: getEndPoint(sample: sample))
//    print(routes)
//    return routes!
//}

func findTime(array: [Vertex<String>], userLevel: Int64) -> Int {
    return buttermilkAdjacencyList.getTime(array: array, userLevel: userLevel)
}

func createGraph(resortID: Int) -> AdjacencyList<String> {
    let adjacencyList = AdjacencyList<String>()
    
    let vertices = AppDatabase().getVertices(id: Int64(resortID))

    for vertex in vertices {
        let tempVertex = adjacencyList.createVertex(data: vertex.stepName, level: vertex.stepLevel)
        adjacencyList.vertextList.append(tempVertex)
    }

    let edges = AppDatabase().getEdges(id: Int64(resortID))

    for n in edges {
        adjacencyList.add(.directed, from: adjacencyList.vertextList[getPoint(name: n.startVertex)!], to: adjacencyList.vertextList[getPoint(name: n.endVertex)!], weight: n.weightValue)
    }

    return adjacencyList
}







