require "employee"
class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name,funding, salaries)
        @name = name
        @funding = funding
        @employees = []
        @salaries = salaries
        #hash with title and salary pairs
    end 

    def valid_title?(title)
        if salaries.has_key?(title)
            return true
        else
            false
        end
    end 

    def >(startup)
        if self.funding > startup.funding
            return true
        else
            false
        end
    end 

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise ArgumentError
        end 
    end 

    def size
        employees.length
    end 

    def pay_employee(employee)
        #employee instance has name and title
        #if the funding is greater than the salary corresponding to title
        money_owed =  @salaries[employee.title]
        if @funding >= money_owed
            employee.pay(money_owed)
            @funding = @funding - money_owed
        else
            raise "Not enough funding"
        end 
    end 

    def payday
        employees.each {|employee| pay_employee(employee)}
    end 

    def average_salary
        sum = 0
        @employees.each do |employee|
            title = employee.title 
            salary = @salaries[title]
            sum += salary
        end
        sum/@employees.length
    end 

    def close
        @employees = []
        @funding = 0
    end 

    def acquire(anotha_startup)
        @funding += anotha_startup.funding
        @salaries = anotha_startup.salaries.merge(@salaries)
        @employees = anotha_startup.employees + @employees
        anotha_startup.close
    end 
end