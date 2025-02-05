public enum EmployeeType {
    case hourly, salaried, comission
}

public protocol PaidWeekly {
    func getWeeklyPay() -> Int
}

public class Employee: PaidWeekly, CustomStringConvertible {
    nonisolated(unsafe) private static var nextIDNumber: Int = 0  // The "nonisolated(unsafe)" was because of an error that may be because of OS version? Delete it if you can't run the project
    public var id: Int
    public var firstName: String
    public var lastName: String
    public var employeeType: EmployeeType
    public var description: String {
        fatalError("Do not create an object of Employee, it is an abstract class")
    }

    init(firstName: String, lastName: String, employeeType: EmployeeType) {
        self.firstName = firstName
        self.lastName = lastName
        self.employeeType = employeeType
        self.id = Employee.getNextID()
    }
    public func getWeeklyPay() -> Int {
        fatalError("Do not create an object of Employee, it is an abstract class")
    }
    static public func getNextID() -> Int {
        nextIDNumber += 1
        return nextIDNumber
    }
}

public class SalariedEmployee: Employee {
    public var annualSalary: Int
    override public var description: String {
        return
            "\(self.firstName) \(self.lastName) is a salaried employee with an annual salary of \(annualSalary)"
    }

    init(firstName: String, lastName: String, annualSalary: Int) {
        self.annualSalary = annualSalary
        super.init(firstName: firstName, lastName: lastName, employeeType: EmployeeType.salaried)
    }

    override public func getWeeklyPay() -> Int {
        return annualSalary / 52
    }
}
public class HourlyEmployee: Employee {
    public var hourlyRate: Int
    public var hoursPerWeek: Int
    override public var description: String {
        return
            "\(self.firstName) \(self.lastName) is a salaried employee with an annual salary of \(hourlyRate)"
    }

    init(firstName: String, lastName: String, hourlyRate: Int, hoursPerWeek: Int) {
        self.hourlyRate = hourlyRate
        self.hoursPerWeek = hoursPerWeek
        super.init(firstName: firstName, lastName: lastName, employeeType: EmployeeType.hourly)
    }

    override public func getWeeklyPay() -> Int {
        return hourlyRate * 5 * hoursPerWeek
    }
}

public class CommissionEmployee: Employee {
    public var totalSales: Int
    public var commisionPercent: Int
    override public var description: String {
        return
            "\(self.firstName) \(self.lastName) is a salaried employee with an annual salary of \(totalSales)"
    }

    init(firstName: String, lastName: String, totalSales: Int, commisionPercent: Int) {
        self.totalSales = totalSales
        self.commisionPercent = commisionPercent
        super.init(firstName: firstName, lastName: lastName, employeeType: EmployeeType.comission)
    }

    override public func getWeeklyPay() -> Int {
        return totalSales * (commisionPercent / 100) * totalSales
    }
}
