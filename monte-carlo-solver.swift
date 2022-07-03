import UIKit
import CoreFoundation

//UTILITIES
class Node<T> {
    var key: T?
    var next: Node?
}

class Stack<T> {
    
    private var top: Node<T>
    private var counter: Int = 0
    
    init() {
        top = Node<T>()
    }
    
    //the number of items - O(1)
    var count: Int {
        return counter
    }
    
    //add item to the stack - O(1)
    func push(withKey key: T) {
        //return trivial case
        guard top.key != nil else {
            top.key = key
            counter += 1
            return
        }
        
        //create new item
        let childToUse = Node<T>()
        childToUse.key = key
            
        //set new created item at top
        childToUse.next = top
        top = childToUse
        //set counter
        counter += 1
    }
    //remove item from the stack - O(1)
    func pop() {
        
        if self.count > 1 {
            top = top.next!
            //set counter
            counter -= 1
            
        }
        else {
            top.key = nil
            counter = 0
        }
    }
    
    //retrieve the top most item - O(1)
    func peek() -> Node<T> {
        return top
    }
    
    //check for value - O(1)
    func isEmpty() -> Bool {
        if self.count == 0 {
            return true
        }
        else {
            return false
        }
    }
}



func lettersToIntDigits(element: String) -> Int
{
    switch element {
    case "A":
        return 10
    case "B":
        return 11
    case "C":
        return 12
    case "D":
        return 13
    case "E":
        return 14
    case "F":
    return 15
    case "G":
        return 16
    default:
        return -1
    }
}

func digitsToIntLetters(element: Int) -> String
{
    switch element {
    case 10:
        return "A"
    case 11:
        return "B"
    case 12:
        return "C"
    case 13:
        return "D"
    case 14:
        return "E"
    case 15:
    return "F"
    case 16:
        return "G"
    default:
        return ""
    }
}

//To Solve
let A=10
let B=11
let C=12
let D=13
let E=14
let F=15
let G=16

//Retrive from the classifier **************
var hardGrid=[
        [0,5,D,F,A,0,0,6,2,0,0,C,G,8,9,0],//V
        [B,4,0,0,5,2,0,0,0,0,9,F,0,0,E,7],//V
        [1,0,9,0,0,7,0,0,0,0,B,0,0,C,0,2],//V
        [2,0,0,0,9,0,0,8,D,0,0,7,0,0,0,4],//V
        [D,F,0,4,7,0,0,A,9,0,0,8,B,0,C,6],//V
        [0,A,8,0,0,1,0,F,B,0,6,0,0,D,5,0],//V
        [0,0,0,0,0,0,3,0,0,F,0,0,0,0,0,0],//V
        [6,0,0,1,B,D,0,0,0,0,2,A,F,0,0,9],//V
        [3,0,0,G,8,4,0,0,0,0,C,5,6,0,0,E],//V
        [0,0,0,0,0,0,2,0,0,9,0,0,0,0,0,0],//V
        [0,D,2,0,0,C,0,5,G,0,4,0,0,1,7,0],//V
        [8,6,0,5,D,0,0,1,3,0,0,E,4,0,A,C],//V
        [F,0,0,0,E,0,0,9,A,0,0,3,0,0,0,1],//V
        [9,0,G,0,0,8,0,0,0,0,5,0,0,E,0,A],//V
        [5,1,0,0,2,3,0,0,0,0,E,9,0,0,4,D],//V
        [0,E,6,7,1,0,0,4,F,0,0,2,8,9,G,0],//V
]

class ParkBenchTimer {

    let startTime:CFAbsoluteTime
    var endTime:CFAbsoluteTime?

    init() {
        startTime = CFAbsoluteTimeGetCurrent()
    }

    func stop() -> CFAbsoluteTime {
        endTime = CFAbsoluteTimeGetCurrent()

        return duration!
    }

    var duration:CFAbsoluteTime? {
        if let endTime = endTime {
            return endTime - startTime
        } else {
            return nil
        }
    }
}

//var time: Double = 0
//var startTime: TimeInterval
//startTime = Date().timeIntervalSinceReferenceDate

var simpleGrid=[
    [5,0,0,0,8,0,0,0,2],
    [3,2,0,0,0,5,0,9,0],
    [0,0,6,0,0,7,0,0,0],
    [0,8,9,7,0,6,0,0,0],
    [0,5,0,0,2,0,0,1,0],
    [0,0,0,5,0,1,6,8,0],
    [0,0,0,3,0,0,5,0,0],
    [0,6,0,4,0,0,0,2,9],
    [9,0,0,0,7,0,0,0,3],
]

//Total time since timer started, in seconds
//time = Date().timeIntervalSinceReferenceDate - startTime
//print(time)


let gridRow = hardGrid.count

let gridCol = hardGrid.count



//MODELING

struct DomaineIntervalle { //Variable
    var taille: Int
    var nb_valeurs:Int
    var presente: [Bool]
    var affectee: Bool
    var valeur = 0
    //Addede
    var NULL: Bool
    init(t : Int) {
        
        self.taille=t
        self.presente=Array(repeating: Bool(true), count: t)
        self.nb_valeurs=self.taille
        self.affectee=false

        //Deal with NULL variable
       if (t == -1)
       {
        NULL=true
        }
        else
       {
         NULL=false
        }
    }
    
    
    func presente(v: Int) -> Bool
    {
       return presente[v]
    }
    mutating func ote(v:Int) -> Bool
    {
        if (presente[v]) {
            presente[v]=false
            nb_valeurs-=1
            return true
        }
        return false
    }
    mutating func remet(v: Int)
    {
        presente[v]=true
        nb_valeurs+=1
    }
    mutating func affecte(v : Int)
    {
        affectee=true
        valeur=v
    }
    mutating func desaffecte()
    {
        affectee=false
    }
}

var pile = Stack<Int>()

func ote (i : Int, j: Int, val : Int) {
    if (grid[i][j].ote(v: val-1)){
        pile.push(withKey: i)
        pile.push(withKey: j)
        pile.push(withKey: val)
    }
}

var tailleNestedMonteCarlo=0

//Init tab with DomaineIntervalle---------------------------------------

func initEasyVariablesCSPGrid(gridRow: Int, gridCol: Int, initialGrid: [Array<Int>]) -> [[DomaineIntervalle]]
{
    var grid = Array(repeating: Array(repeating: DomaineIntervalle(t: gridRow),count: gridRow),count: gridCol);
    for i in 0..<gridCol
    {
        for j in 0..<gridRow
        {
            if (initialGrid[i][j]==0)
            {
                grid[i][j]=DomaineIntervalle(t: gridRow)
                tailleNestedMonteCarlo+=1
            }
            else
            {
                grid[i][j]=DomaineIntervalle(t: gridRow)
                grid[i][j].affecte(v: initialGrid[i][j])
            }
        }
    }
    //FORWARD CHECKING FOR ALREADY PLACED VALUES
    for ii in 0..<gridRow{
        for jj in 0..<gridCol
        {
            if (grid[ii][jj].affectee)
            {
                let val = grid[ii][jj].valeur
                for i in 0..<gridRow
                {
                    if (!(i==ii))
                    {
                        if (!(grid[i][jj].affectee))
                        {
                            //grid[i][jj].ote(v: val) <-- Problem
                            grid[i][jj].ote(v: val-1)
                            if (grid[i][jj].nb_valeurs==0)
                            {
                                print("Unsolvable")
                            }
                        }
                    }
                }
                //Une seule fois la meme valeur par ligne
                for j in 0..<gridCol
                {
                   if (!(jj == j))
                   {
                       if (!grid[ii][j].affectee)
                       {
                            grid[ii][j].ote(v: val-1)
                           if (grid[ii][j].nb_valeurs==0)
                           {
                               print("unsolvalbe")
                           }
                       }
                   }
                }
                //Une seule fois la meme valeur par carré
                let starti = tailleCarre * (ii/tailleCarre), startj = tailleCarre * (jj/tailleCarre)
                for iii in starti..<starti+tailleCarre
                {
                    for jjj in startj..<startj+tailleCarre
                    {
                        if (!(jj == jjj) && !(iii == ii))
                        {
                            if (!grid[iii][jjj].affectee)
                            {
                                grid[iii][jjj].ote(v: val-1)
                                if (grid[iii][jjj].nb_valeurs==0)
                                {
                                    print("Unsolvable")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return grid
}

let TailleMax = 25

var tailleCarre=4, taille=Int(pow(Double(tailleCarre), 2))

var grid=initEasyVariablesCSPGrid(gridRow: gridRow, gridCol: gridCol, initialGrid: hardGrid)

//print(tailleNestedMonteCarlo)

func printgrid(_ initialGameGrid: [[DomaineIntervalle]])
{
    for i in 0..<gridRow
    {
        for j in 0..<gridCol{
            print(initialGameGrid[i][j].valeur, terminator: " ")
        }
        print(" ")
    }
     print("                    ")
}


//var game=CSPGrid(initialGameGrid)

//---------------------------------------




//var varr = Array(repeating: Array(repeating: DomaineIntervalle(), count: TailleMax),count: TailleMax)

//grid -> var


func consistant(i: Int, j: Int, val: Int) -> Bool
{
    //Une seule fois la même valeur par ligne
    for ii in 0..<taille
    {
        if (!(ii == i))
        {
            if (grid[ii] [j].affectee)
            {
                if (grid[ii][j].valeur==val)
                {
                 //   print("ligne")
                    return false;
                }
            }
        }
    }
    //Une seule fois la meme valeur par colonne
    for jj in 0..<taille
    {
       if (!(jj == j))
       {
           if (grid[i] [jj].affectee)
           {
               if (grid[i][jj].valeur==val)
               {
                // print("colonne")
                   return false;
               }
           }
       }
    }
    //Une seule fois la meme valeur par carre
    let starti = tailleCarre * (i/tailleCarre), startj = tailleCarre * (j/tailleCarre)
    for ii in starti..<starti+tailleCarre
    {
        for jj in startj..<startj+tailleCarre
        {
            if (!(jj == j) && !(ii == i))
            {
                if (grid[ii][jj].affectee)
                {
                    if (grid[ii][jj].valeur == val)
                    {
                       //  print("box")
                        return false
                    }
                }
            }
        }
    }
    return true
}



func consistantfc(i: Int, j: Int, val: Int) -> Bool
{
    pile.push(withKey: -1)
    //Une seule fois la même valeur par colonne
    for ii in 0..<taille
    {
        if (!(ii == i))
        {
            if (!grid[ii][j].affectee)
            {
                ote(i: ii, j: j, val: val)
                if (grid[ii][j].nb_valeurs==0)
                {
                    return false;
                }
            }
        }
    }
    //Une seule fois la meme valeur par ligne
    for jj in 0..<taille
    {
       if (!(jj == j))
       {
           if (!grid[i][jj].affectee)
           {
               ote(i: i, j: jj, val: val)
               if (grid[i][jj].nb_valeurs==0)
               {
                   return false;
               }
           }
       }
    }
    //Une seule fois la meme valeur par carré
    let starti = tailleCarre * (i/tailleCarre), startj = tailleCarre * (j/tailleCarre)
    for ii in starti..<starti+tailleCarre
    {
        for jj in startj..<startj+tailleCarre
        {
            if (!(jj == j) && !(ii == i))
            {
                if (!grid[ii][jj].affectee)
                {
                    ote(i: ii, j: jj, val: val)
                    if (grid[ii][jj].nb_valeurs==0)
                    {
                        return false
                    }
                }
            }
        }
    }
    return true
}


func choisitVariable(i :inout Int, j :inout Int) -> DomaineIntervalle?
{
    for ii in 0..<taille
    {
        for jj in 0..<taille
        {
            if(!(grid[ii][jj].affectee))
            {
                i=ii
                j=jj
                return grid[i][j]
            }
        }
    }
    return nil
}

//Ordre d'instanciation des variables
func choisitVariableBetter(i : inout Int, j: inout Int) ->  DomaineIntervalle?
{
    var v: DomaineIntervalle?
    v=nil
    var min = taille + 1, memi:Int, memj:Int
    for ibis in 0..<taille{
        for jbis in 0..<taille{
            if (!grid[ibis][jbis].affectee)
            {
                if(grid[ibis][jbis].nb_valeurs<min)
                {
                    min=grid[ibis][jbis].nb_valeurs
                    i = ibis
                    j = jbis
                    v = grid[i][j]
                }
            }
        }
    }
    return v
}


func enumereValeurs (i: Int, j : Int, val: inout [Int]) -> Int
{
    var nb = 0
    for k in 1...taille
    {
        if (grid[i][j].presente(v: k-1))
        {
            val[nb]=k
            nb+=1;
        }
    }
    //Get a proper domain
    if (nb < taille)
    {
        for _ in nb..<taille
        {
            val.removeLast()
        }
    }
    return nb
}



func remet() {
    while (pile.peek().key! != -1){
        let val = pile.peek().key!
        pile.pop()
        let j = pile.peek().key!
        pile.pop()
        let i = pile.peek().key!
        pile.pop()
        grid[i][j].remet(v: val-1)
    }
    
    pile.pop()
}




//Backtrack
func backtrack() -> Bool
{
    var i=0
    var j=0
    let d = choisitVariable(i: &i, j: &j)
   // print(i)
  //  print(j)
    if (d==nil)
    {
        return true
    }
   // var val = Array(repeating: Int(),count: TailleMax)
    var val = Array(repeating: Int(),count: taille)
    let nb_vals = enumereValeurs(i: i, j: j, val: &val)
    for k in 0..<nb_vals
    {
        grid[i][j].affecte(v: val[k])
       // printgrid(grid)
        if (consistant(i: i, j: j, val: val[k]))
        {
            if(backtrack())
            {
                return true
            }
        }
        grid[i][j].desaffecte()
        grid[i][j].valeur=0
    }
    return false
}


//Forward checking
func fc() -> Bool
{
    var i=0,j=0
    let d = choisitVariableBetter(i: &i, j: &j)
    if (d==nil)
    {
        return true
    }
   // var val = Array(repeating: Int(),count: TailleMax)
    var val = Array(repeating: Int(),count: taille)
    let nb_vals = enumereValeurs(i: i, j: j, val: &val)
    for k in 0..<nb_vals
    {
        //printgrid(grid)
        grid[i][j].affecte(v: val[k])
        //printgrid(grid)
        if (consistantfc(i: i, j: j, val: val[k]))
        {
            if(fc())
            {
                return true
            }
        }
        remet()
        grid[i][j].desaffecte()
        grid[i][j].valeur=0
    }
    return false
}


//Limited Deviation Search
func trylds (i : Int, j: Int, val: Int, ordre: Int) -> Bool
{
    grid[i][j].affecte(v: val)
    if (consistantfc(i: i, j: j, val: val))
    {
      
        if (lds(ordre: ordre))
        {
            return true
        }
    }
    remet()
    grid[i][j].desaffecte()
    return false
}


func lds(ordre : Int) -> Bool
{
    var i=0,j=0
    let d = choisitVariableBetter(i: &i, j: &j)
    if (d==nil)
    {
        return true
    }
    var val = Array(repeating: Int(),count: taille)
    let nb_vals = enumereValeurs(i: i, j: j, val: &val)
    if (ordre == 0)
    {
        if (trylds(i: i, j: j, val: val[0], ordre: ordre))
        {
            return true
        }
    }
    else
    {
        for k in 1..<nb_vals
        {
            if (trylds(i: i, j: j, val: val[k], ordre: ordre))
            {
                return true
            }
        }
        if (nb_vals>0)
        {
            if (trylds(i: i, j: j, val: val[0], ordre: ordre))
            {
                return true
            }
        }
    }
    return false
}

func id_lds() -> Bool
{
    for ordre in 0..<taille*taille
    {
        if (lds(ordre: ordre))
        {
            return true
        }
    }
    return false
}

//Nested Monte Carlo
struct Move {
    var i:Int
    var j:Int
    var value:Int
    init()
    {
        self.i=0
        self.j=0
        self.value=0
    }
    init(i: Int,j: Int, value:Int)
    {
        self.i=i
        self.j=j
        self.value=value
    }
}

var variation = Array(repeating: Move(), count: 1000)


func sample (depth: Int) -> Int
{
    var i=0,j=0,maxd=depth
    let d = choisitVariableBetter(i: &i, j: &j)
    if (d==nil)
    {
        return depth
    }
    var val = Array(repeating: Int(),count: taille)
    let nb_vals = enumereValeurs(i: i, j: j, val: &val)
    if (nb_vals==0) {
        return depth
    }
    let indice = Int.random(in: 0..<nb_vals)
    let m = Move(i:i,j:j, value: val[indice])
    variation[depth]=m
    grid[i][j].affecte(v: val[indice])
   
    if (consistantfc(i: i, j: j, val: val[indice]))
    {
        maxd=sample(depth: depth+1)
    }
    if (maxd == taille*taille)
    {
        return maxd
    }
    remet()
    grid[i][j].desaffecte()
    return maxd
}


var nbBestRollout = Array(repeating: Int(), count: 4)
var bestRollout = Array(repeating: Array(repeating: Move(), count: 1000), count: 4)
//var debug=0

//debug+=1

//if (debug==1) { print... ]

func nested(nbPrefix: Int, prefix: inout [Move] ,n : Int) -> Int
{
    let nbPrefixStart = nbPrefix
    var tempnbPrefix=nbPrefix
    nbBestRollout[n]=0
    while true
    {
         var i=0,j=0
         let d = choisitVariableBetter(i: &i, j: &j)
         if (d==nil)
         {
            return tempnbPrefix
         }
         var val = Array(repeating: Int(),count: taille)
         let nb_vals = enumereValeurs(i: i, j: j, val: &val)
         var bestMove = bestRollout[n][tempnbPrefix]
         var best = nbBestRollout[n]
         for k in 0..<nb_vals
         {
            let m = Move(i: i, j: j, value: val[k])
            grid[i][j].affecte(v: val[k])
            if (consistantfc(i: i, j: j, val: val[k]))
            {
                if (n==1)
                {
                    let lengthPlayout = sample(depth: tempnbPrefix+1)
                    if (lengthPlayout > best)
                    {

                        best = lengthPlayout
                        bestMove=m
                        nbBestRollout[n] = best
                        bestRollout[n][tempnbPrefix] = m
                        for l in (tempnbPrefix+1)..<lengthPlayout
                        {
                            bestRollout[n][l]=variation[l]
                        }
                    }
                }
                else
                {
                    //print("k : \(k) for nb_vals = \(nb_vals) and i : \(i), j : \(j)")
                    let lengthPlayout = nested(nbPrefix: n+1, prefix: &prefix, n: n-1)
                    if (lengthPlayout>best)
                    {
                        best = lengthPlayout
                        bestMove=m
                        nbBestRollout[n]=best
                        bestRollout[n][tempnbPrefix] = m
                        for l in nbPrefix+1..<lengthPlayout
                        {
                            bestRollout[n][l] = bestRollout[n-1][l]
                        }
                    }
                }
            }
            if (best==tailleNestedMonteCarlo)
            {
                return best
            }
            remet()
            grid[i][j].desaffecte()
        }
        grid[bestMove.i][bestMove.j].affecte(v: bestMove.value)
        if (consistantfc(i: bestMove.i, j: bestMove.j, val: bestMove.value))
        {
            prefix[tempnbPrefix] = bestMove
            tempnbPrefix+=1
        }
        else
        {
            break
        }
    }
    if (tempnbPrefix == tailleNestedMonteCarlo)
    {
        return tempnbPrefix
    }
    for n in stride(from: nbPrefix-1, through: nbPrefixStart, by: -1) //
    {
        remet()
        grid[prefix[n].i][prefix[n].j].desaffecte()
    }
    return tempnbPrefix
}

func nestedMonteCarlo()
{
    while true{
        var prefix = Array(repeating: Move(), count: 1000)
        let nb = nested(nbPrefix: 0, prefix: &prefix, n: 1)
        if (nb == tailleNestedMonteCarlo)
        {
            break
        }
    }
}

let timer = ParkBenchTimer()
//backtrack()
//fc()
id_lds()
//nestedMonteCarlo()
print("The solving took :  \(timer.stop()) seconds.")
printgrid(grid)


