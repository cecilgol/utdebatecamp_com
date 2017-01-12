class EmployeeMailer < ApplicationMailer

    def welcome_email(employee)
        @user = employee.account.user
        
        mail(to: @user.email, subject:"Thank you for applying to work at the UTNIF")
    end

    def hired_email(employee)
        @user = employee.account.user

        mail(to: @user.email, subject:"Your application has been accepted by UTNIF")
    end

    
end
