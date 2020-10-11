import Foundation

struct RegularCar {
    var brand: String
    var year: Int
}

extension RegularCar: CustomStringConvertible {
    
    var description: String {
        return """
            Car brand \(brand) was made in \(year)
            """
    }
    
}

struct Queue<T> {
    
    var list = [T]()
    
    mutating func enque(_ element: T) {
        list.append(element)
    }
    
    mutating func deque() -> T? {
        if !list.isEmpty {
            return list.removeLast()
        } else {
            return nil
        }
    }
    
    var peek: T? {
        return list.first
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    subscript(elements: UInt ...) -> [T] {
        var result = [T]()
        
        for index in elements where index < self.list.count {
            result.append(self.list[Int(index)])
        }
        return result
    }
    
}

extension Queue {
    
    func filterData(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for element in list {
            if predicate(element) {
                result.append(element)
            }
        }
        return result
    }
    
}

var conveyer = Queue<RegularCar>()
conveyer.enque(.init(brand: "BMW", year: 2015))
conveyer.enque(.init(brand: "Toyota", year: 2016))
conveyer.enque(.init(brand: "Volkswagen", year: 2016))
conveyer.enque(.init(brand: "Maseratti", year: 1976))
conveyer.enque(.init(brand: "Hyundai", year: 2020))

print(conveyer.filterData(predicate: {$0.year == 2016}))

print(conveyer[0,2,10])
