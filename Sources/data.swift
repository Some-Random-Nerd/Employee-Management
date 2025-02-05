@MainActor public let e1 = SalariedEmployee(
    firstName: "Jim", lastName: "Jackson", annualSalary: 50000)
@MainActor public let e2 = SalariedEmployee(
    firstName: "Angela", lastName: "Philips", annualSalary: 65000)
@MainActor public let e3 = HourlyEmployee(
    firstName: "Travis", lastName: "Anderson", hourlyRate: 15, hoursPerWeek: 40)
@MainActor public let e4 = HourlyEmployee(
    firstName: "Denise", lastName: "Fleming", hourlyRate: 18, hoursPerWeek: 40)
@MainActor public let e5 = CommissionEmployee(
    firstName: "Sue", lastName: "Anthony", totalSales: 6000, commisionPercent: 20)
@MainActor public let e6 = CommissionEmployee(
    firstName: "Richard", lastName: "Sherman", totalSales: 6300, commisionPercent: 18)

@MainActor public let EMPLOYEE_DATA: [Int: Employee] =
    [
        e1.id: e1,
        e2.id: e2,
        e3.id: e3,
        e4.id: e4,
        e5.id: e5,
        e6.id: e6,
    ]
