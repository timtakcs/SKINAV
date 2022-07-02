//
//  DBManager.swift
//  SKINAV (iOS)
//
//  Created by OTakhtarova on 3/3/22.
//

import SQLite

class AppDatabase {
    private var database: Connection?
    
    //create instance variables for the tables
    private var userData: Table!
    private var resortData: Table!
    private var liftData: Table!
    private var routeData: Table!
    private var stepData: Table!
    private var vertexData: Table!
    private var savedRouteData: Table!
    private var adjacencyMatrices: Table!
    
    //create instance variables for user
    private var userID: Expression<Int64>!
    private var name: Expression<String>!
    private var lastname: Expression<String>!
    private var level: Expression<Int64>!
    
    //create instance variables for resorts
    private var resortID: Expression<Int64>!
    private var resortName: Expression<String>!
    
    //create instance variables for lifts
    private var liftID: Expression<Int64>!
    private var liftName: Expression<String>!
    private var resortIDLift: Expression<Int64>!
    
    //create instance variables for routes
    private var routeID: Expression<Int64>!
    private var routeName: Expression<String>!
    private var routeRating: Expression<Int64>!
    private var time: Expression<Int64>!
    
    //create instance variables for steps in routes
    private var stepRouteID: Expression<Int64>!
    private var stepID: Expression<Int64>!
    private var stepName: Expression<String>!
    private var stepLevel: Expression<Int64>!
    
    //create instance variables for vertices
    private var vertexName: Expression<String>!
    private var vertexLevel: Expression<Int64>!
    private var vertexID: Expression<Int64>!
    private var resortIDVertex: Expression<Int64>!
    
    //create instance variables for steps in route 2.0
    private var routeIDSaved: Expression<Int64>!
    private var runID: Expression<Int64>!
    
    //create instance variables for adjacency matrices
    private var startVertexID: Expression<Int64>!
    private var endVertexID: Expression<Int64>!
    private var weight: Expression<Int64>!
    private var resortIDMatrix: Expression<Int64>!
        
    init() {
        do{
            //connect to database, create a path in the document directory
            
            let path = Bundle.main.path(forResource: "SKINAVdb", ofType: "sqlite3")!

            let database = try Connection(path, readonly: true)

            
//            let filepath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
//
//            database = try Connection("\(filepath)/SkiingAppDatabase.sqlite3")
            
            
            
            //declare userData table
//            userData = Table("userData")
//
//            //declare resortData table
//            resortData = Table("resortData")
//
//            //declare liftData table
//            liftData = Table("liftData")
//
//            //declare the routeData table
//            routeData = Table("routeData")
//
//            //declare the stepData table
//            stepData = Table("stepData")
//
//            //declare the vertexData table
//            vertexData = Table("vertexData")
//
//            //declare the saved route table 2.0
//            savedRouteData = Table("savedRouteData")
//
//            //declare the adjacency matrix table
//            adjacencyMatrices = Table("adjacencyMatrices")
//
//            //identify columns in userData
//            userID = Expression<Int64>("userID")
//            name = Expression<String>("Name")
//            lastname = Expression<String>("Lastname")
//            level = Expression<Int64>("Level")
//
//            //identify columns in resortData
//            resortID = Expression<Int64>("resorytID")//typo that i don't know how to fix because DBBrowser is a pain in the ass
//            resortName = Expression<String>("resortName")
//
//            //identify columns in liftData
//            liftID = Expression<Int64>("liftID")
//            liftName = Expression<String>("liftName")
//            resortIDLift = Expression<Int64>("resortID")
//
//            //identify the columns in routeData
//            routeID = Expression<Int64>("routeID")
//            routeName = Expression<String>("routeName")
//            routeRating = Expression<Int64>("routeRating")
//            time = Expression<Int64>("routeTime")
//
//            //identify the columns in stepData
//            stepRouteID = Expression<Int64>("routeID")
//            stepID = Expression<Int64>("stepID")
//            stepName = Expression<String>("stepName")
//            stepLevel = Expression<Int64>("stepLevel")
//
//            //identify columns in vertexData
//            vertexName = Expression<String>("vertexName")
//            vertexLevel = Expression<Int64>("vertedLevel")
//            vertexID = Expression<Int64>("vertexID")
//            resortIDVertex = Expression<Int64>("resortID")
//
//            routeIDSaved = Expression<Int64>("routeID")
//            runID = Expression<Int64>("runID")
//
//            startVertexID = Expression<Int64>("StartRunID")
//            endVertexID = Expression<Int64>("EndRunID")
//            weight = Expression<Int64>("Weight")
//            resortIDMatrix = Expression<Int64>("resortID")
//
//            //check if the databases already exist
//            //if not, create themm
//            if (!UserDefaults.standard.bool(forKey: "is_db_created")) {
//                try database?.run(userData.create { (t) in
//                    t.column(userID, primaryKey: true)
//                    t.column(name)
//                    t.column(lastname)
//                    t.column(level)
//                })
//
//                try database?.run(resortData.create { (u) in
//                    u.column(resortID, primaryKey: true)
//                    u.column(resortName)
//                })
//
//                try database?.run(liftData.create { (v) in
//                    v.column(liftID, primaryKey: true)
//                    v.column(liftName)
//                    v.column(resortIDLift)
//                })
//
//                try database?.run(routeData.create { (w) in
//                    w.column(routeID, primaryKey: true)
//                    w.column(routeName)
//                    w.column(routeRating)
//                    w.column(time)
//                })
//
//                try database?.run(stepData.create { (x) in
//                    x.column(stepRouteID)
//                    x.column(stepID, primaryKey: true)
//                    x.column(stepName)
//                    x.column(stepLevel)
//                })
//
//                try database?.run(vertexData.create { (y) in
//                    y.column(vertexName)
//                    y.column(vertexLevel)
//                    y.column(vertexID, primaryKey: true)
//                    y.column(resortID)
//                })
//
//                try database?.run(vertexData.create { (z) in
//                    z.column(routeIDSaved)
//                    z.column(runID)
//                })
//
//                try database?.run(vertexData.create { (a) in
//                    a.column(startVertexID)
//                    a.column(endVertexID)
//                    a.column(weight)
//                    a.column(resortID)
//                })
//
//                UserDefaults.standard.set(true, forKey: "is_db_created") //check for key, tells whether database exists
//            }
            print(path)//debugging
        }
        catch{
            print("couldn't create database")
        }
    }
    
    func copyDatabaseIfNeeded() -> Bool{
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
        let destinationPath = "\(documents)/SKINAVdb.sqlite3"
        let exists = FileManager.default.fileExists(atPath: destinationPath)
        guard !exists else { return false }
        do {
            try FileManager.default.copyItem(atPath: Bundle.main.path(forResource: "SKINAVdb", ofType: "sqlite3")!, toPath: destinationPath)
            return true
        } catch {
          print("error during file copy: \(error)")
            return false
        }
    }
    
    //function that inserts data into user database, takes in the fields from ProfileCreatorView
    public func createUser(nameV: String, lastnameV: String, levelV: Int64) {
        do {
            try database?.run(userData.insert(name <- nameV, lastname <- lastnameV, level <- levelV))
        }
        catch let error{
            print("couldn't insert into database\(error)")
        }
    }
    
    // function getUser returns an array of users
    public func getUser() -> userProp {
        var userProps: [userProp] = []
        
        userData = userData.order(userID.desc)
        
        do {
            for user in try database!.prepare(userData){
                let UserProp: userProp = userProp()
                
                UserProp.userID = user[userID]
                UserProp.name = user[name]
                UserProp.lastname = user[lastname]
                UserProp.level = user[level]
                
                userProps.append(UserProp)
            }
            for user in userProps {
                print(user.name)
            }
        }
        catch let error{
            print("can't return user data \(error)")
        }
        return userProps[0]
    }
    
    public func editUser(user: userProp, Name: String, Lastname: String, Level: Int) {
        let ID = user.userID
        do {
            let user = userData.filter(userID == ID)
            
            try database?.run(user.update(name <- Name, lastname <- Lastname, level <- Int64(Level)))
        }
        catch let error{
            print("can't return user data \(error)")
        }
    }
    
    //function that returns an array of all of the resort names in the database
    public func getResorts() -> [resort] {
        var resortNames: [resort] = []
        
        resortData = resortData.order(resortID.desc)
        
        do{
            for tempResort in try database!.prepare(resortData) {
                let Resort: resort = resort()
                
                Resort.resortID = tempResort[resortID]
                Resort.resortName = tempResort[resortName]
                
                resortNames.append(Resort)
            }
        }
        catch let error{
            print("can't return resort data\(error)")
        }
        
        return resortNames.reversed()
    }
    
    //function that returns an array of all the lift objects in the database
    public func getLift() -> [lift] {
        var lifts: [lift] = []
        
        do{
            for tempLift in try database!.prepare(liftData){
                let Lift: lift = lift()
                
                Lift.liftID = tempLift[liftID]
                Lift.liftName = tempLift[liftName]
                Lift.resortIDLift = tempLift[resortIDLift]
                
                lifts.append(Lift)
            }
        }
        catch let error{
            print("cant return lift data \(error)")
        }
        return lifts
    }
    
    public func getVertices(id: Int64) -> [step] {
        var steps: [step] = []
        
        let query = vertexData.where(resortID == id)
        
        do {
            for tempStep in try database!.prepare(query) {
                var Step: step = step()
                
                Step.stepName = tempStep[vertexName]
                Step.stepLevel = Int(tempStep[vertexLevel])
                Step.stepID = Int(tempStep[vertexID])
                
                steps.append(Step)
            }
        }
        catch let error{
            print("couldn't get routes \(error)")
        }
        return steps
    }
    
    public func getVerticesForDisplay() -> [step] {
        var steps: [step] = []
        
        let query = vertexData.order(vertexID.desc)
        
        do {
            for tempStep in try database!.prepare(query) {
                var Step: step = step()
                
                Step.stepName = tempStep[vertexName]
                Step.stepLevel = Int(tempStep[vertexLevel])
                Step.stepID = Int(tempStep[vertexID])
                Step.stepResortID = Int(tempStep[resortIDVertex])
                
                steps.append(Step)
            }
        }
        catch let error{
            print("couldn't get routes \(error)")
        }
        return steps
    }
    
    public func getEdges(id: Int64) -> [dbEdge] {
        var edges: [dbEdge] = []
    
        let queryForEdges = adjacencyMatrices.where(resortID == id)
        
        do{
            for tempEdge in try database!.prepare(queryForEdges) {
                var edge = dbEdge()
                
                let findStartVertexQuery = vertexData.where(vertexID == startVertexID)
                for tempVertex in try database!.prepare(findStartVertexQuery) {
                    edge.startVertex = tempVertex[vertexName]
                }
                
                let findEndVertexQuery = vertexData.where(vertexID == endVertexID)
                for tempVertex in try database!.prepare(findEndVertexQuery) {
                    edge.endVertex = tempVertex[vertexName]
                }
                
                edge.weightValue = Int(tempEdge[weight])
                
                edges.append(edge)
            }
        }
        catch let error{
            print("couldn't get routes \(error)")
        }
        return edges
        
    }
    
    public func saveRoute(name: String, array: [Vertex<String>]) {
        do {
            try database?.run(routeData.insert(routeName <- name))
            
            let count = (try database?.scalar(routeData.count))!
            
            for element in array{
                try database?.run(stepData.insert(stepRouteID <- Int64(count), stepName <- element.data, stepLevel <- Int64(element.level)))
            }
        }
        catch let error {
            print("couldn't save route\(error)")
        }
    }
    
    public func saveRouteNew(name: String, opinion: Int, array: [Vertex<String>], level: Int) {
        do {
            try database?.run(routeData.insert(routeName <- name, routeRating <- Int64(opinion), time <- Int64(findTime(array: array, userLevel: Int64(level)))))

            let count = (try database?.scalar(routeData.count))!

            for element in array {
                let query = vertexData.where(vertexName == element.data)
                
                for temp in try database!.prepare(query) {
                    try database?.run(savedRouteData.insert(routeID <- Int64(count), runID <- temp[vertexID]))
                }
            }


        }
        catch let error{
            print("couldn't save route \(error)")
        }
    }
    public func getRoutes() -> [route] {
        var routes: [route] = []
        
        routeData = routeData.order(routeID.desc)
        
        do {
            for tempRoute in try database!.prepare(routeData) {
                let Route: route = route()
                
                Route.routeID = tempRoute[routeID]
                Route.routeName = tempRoute[routeName]
                Route.routeRating = tempRoute[routeRating]
                Route.time = tempRoute[time]
                
                routes.append(Route)
            }
        }
        catch let error{
            print("couldn't get routes \(error)")
        }
        
        return routes
    }
    
    public func getStepsNew(id: Int64) -> [step] {
        var steps : [step] = []
        
        let findIDQuery = savedRouteData.where(routeID == id)
        
        do {
            for tempSteps in try database!.prepare(findIDQuery) {
                
                let findVerticesQuery = vertexData.where(vertexID == tempSteps[runID])
                
                for v in try database!.prepare(findVerticesQuery) {
                    var Step: step = step()
                    
                    Step.stepName = v[vertexName]
                    Step.stepLevel = Int(v[vertexLevel])
                    
                    steps.append(Step)
                }
            }
        }
        catch let error{
            print("couldnt return steps \(error)")
        }
        return steps
    }
    
    public func getSteps(id: Int64) -> [run]{
        var steps: [run] = []
        
        var query = stepData.where(stepRouteID == id)
        
        query = query.order(stepID.asc)
        
        do{
            for tempStep in try database!.prepare(query) {
                let Step: run = run()
                
                Step.stepRouteID = tempStep[stepRouteID]
                Step.stepID = tempStep[stepID]
                Step.stepName = tempStep[stepName]
                Step.stepLevel = tempStep[stepLevel]
                
                steps.append(Step)
            }
        }
        catch let error{
            print("couldn't get steps \(error)")
        }
        return steps
    }
    
}

