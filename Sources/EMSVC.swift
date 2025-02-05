class EMSVC {
    var employees: [Int: Employee] = [:]  // id: Employee
    let help: String =
        """
            info - get an employee's info
            report - print all employee information
            adds - add salaried employee
            addh - add hourly employee
            addc - add commission employee
            pay - run the weekly payroll report
            help - display this menu
            quit - exit the system
        """

    public func runSystem() {
        print("WELCOME TO THE EMPLOYEE MANAGEMENT SYSYSTEM")

        while true {
            print("command -> ", terminator: "")

            let input = readLine()!

            if input == "quit" {
                break
            }

            else if input == "help" {
                print(self.help)
                continue
            }

            else if input == "report" {
                self.report()
                continue
            }

            else if input == "adds" {
                self.adds()
                continue
            }

            else if input == "addh" {
                self.addh()
                continue
            }

            else if input == "addc" {
                self.addc()
                continue
            }

            else if input == "pay" {
                self.pay()
                continue
            }

            else if input == "info" {
                self.info()
                continue
            }

            else {
                print("That is not a command, please try again")
            }
        }
    }

    private func report() {
        for i in self.employees {
            print(
                "   \(i.value.id) \(i.value.lastName), \(i.value.firstName) (\(i.value.employeeType))",
                terminator: "\n    ")

            if i.value is CommissionEmployee {
                print(
                    "   Commission Rate: \((i.value as? CommissionEmployee)!.commisionPercent)\n       Total Sales: \((i.value as? CommissionEmployee)!.totalSales)"
                )
            } else if i.value is HourlyEmployee {
                print(
                    "   Hourly Rate: \((i.value as? HourlyEmployee)!.hourlyRate)\n       Hours/Week: \((i.value as? HourlyEmployee)!.hoursPerWeek)"
                )
            } else if i.value is SalariedEmployee {
                print("   Annual Salary: \((i.value as? SalariedEmployee)!.annualSalary)")
            }
        }
    }

    private func adds() {
        print("Enter first name", terminator: " -> ")

        let firstName = readLine()!

        print("Enter last name", terminator: " -> ")

        let lastName = readLine()!

        print("Enter annual salary", terminator: " -> ")

        let annualSalary = Int(readLine()!)!

        let newEmployee = SalariedEmployee(
            firstName: firstName, lastName: lastName, annualSalary: annualSalary)
        self.employees[newEmployee.id] = newEmployee
    }

    private func addh() {
        print("Enter first name", terminator: " -> ")

        let firstName = readLine()!

        print("Enter last name", terminator: " -> ")

        let lastName = readLine()!

        print("Enter hourly rate", terminator: " -> ")

        let hourlyRate = Int(readLine()!)!

        print("Enter hours/week", terminator: " -> ")

        let hoursPerWeek = Int(readLine()!)!

        let newEmployee = HourlyEmployee(
            firstName: firstName, lastName: lastName, hourlyRate: hourlyRate,
            hoursPerWeek: hoursPerWeek)
        self.employees[newEmployee.id] = newEmployee
    }

    private func addc() {
        print("Enter first name", terminator: " -> ")

        let firstName = readLine()!

        print("Enter last name", terminator: " -> ")

        let lastName = readLine()!

        print("Enter total sales", terminator: " -> ")

        let totalSales = Int(readLine()!)!

        print("Enter commission percent", terminator: " -> ")

        let commissionPercent = Int(readLine()!)!

        let newEmployee = CommissionEmployee(
            firstName: firstName, lastName: lastName, totalSales: totalSales,
            commisionPercent: commissionPercent)
        self.employees[newEmployee.id] = newEmployee
    }

    private func pay() {
        for i in self.employees {
            if i.value is SalariedEmployee {
                print(
                    "\(i.value.firstName) \(i.value.lastName) - \((i.value as? SalariedEmployee)!.annualSalary / 52)"
                )
            } else if i.value is CommissionEmployee {
                print(
                    "\(i.value.firstName) \(i.value.lastName) - \((i.value as? CommissionEmployee)!.totalSales * (i.value as? CommissionEmployee)!.commisionPercent / 100 )"
                )
            } else if i.value is HourlyEmployee {
                print(
                    "\(i.value.firstName) \(i.value.lastName) - \((i.value as? HourlyEmployee)!.hoursPerWeek * (i.value as? HourlyEmployee)!.hourlyRate)"
                )
            }
        }
    }

    private func info() {
        print("Enter the employee ID -> ", terminator: "")

        let employee = self.employees[Int(readLine()!)!]

        if employee == nil {
            print("No employee found with that ID")
            return
        }

        print(
            "   \(employee!.id) \(employee!.lastName), \(employee!.firstName) (\(employee!.employeeType))",
            terminator: "\n    ")

        if employee is CommissionEmployee {
            print(
                "   Commission Rate: \((employee as? CommissionEmployee)!.commisionPercent)\n       Total Sales: \((employee as? CommissionEmployee)!.totalSales)"
            )
        } else if employee is HourlyEmployee {
            print(
                "   Hourly Rate: \((employee as? HourlyEmployee)!.hourlyRate)\n       Hours/Week: \((employee as? HourlyEmployee)!.hoursPerWeek)"
            )
        } else if employee is SalariedEmployee {
            print("   Annual Salary: \((employee as? SalariedEmployee)!.annualSalary)")
        }

        return
    }

    public func loadEmployees(employees: [Int: Employee]) { self.employees = employees }
}
