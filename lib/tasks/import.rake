require 'csv'
namespace :import do

    desc "Import Users from CSV - this is real dumb, but sorta fun!"
    task :users, [:filename_arg] => :environment do |task,args|
        student_counter = 0
        parent_counter = 0


        filename = args[:filename_arg]
        # id	✓student.account.last_name	✓student.account.first_name	✓student.filed	✓student.account.birthday	✓student.account.address1	✓student.account.city	✓student.account.state	✓student.account.zip	✓parent.1.account.name	✓parent.2.account.name	✓parent.1.account.home_phone	✓parent.1.account.other_phone	✓parent.1.account.cell_phone	✓parent.2.account.home_phone	✓parent.2.account.other_phone	✓parent.2.account.cell_phone	✓student.student_forms.off_campus_permission	✓student.student_forms.release_and_indemnification	✓student.student_forms.witness	✓camp	✓program	Session	✓student.student_forms.treatment_consent	✓student.gender	✓student.account.email	✓parent.1.account.email	parent.2.account.email	student.emergency_contacts.name	student.emergency_contacts.name	student.emergency_contacs.phone	students.emergency_contacts.phone	Copy Insurance card?	Policy information listed?	Insurer	Group #	Policy #	Plan #	Physician auth needed?	Physician	Physician #	Allergies	student.student_forms.allergies	Dietary restrictions yes?	student.diet	Medicine allergy?	student.medicine_allergy	Need med at camp?	Need to take Meds at camp? List	May posess and self-admin? Y/N	May posess and self-admin? List	student.student_forms.media_release	student.commuter	Notes exist?	What's Missing?	Requested paperwork	student.notes

        CSV.foreach(filename, headers: true) do |row|
            # Student hash
            student_account =  Account.new({
                first_name:row['student.account.first_name'],
                last_name:row['student.account.last_name'],
                address1:row['student.account.address1'],
                address2:'NaN',
                city:row['student.account.city'],
                state:row['student.account.state'],
                zipcode:row['student.account.zip'],
                birthday:row['student.account.birthday']&.to_date,
                email: row['student.account.email'],
                cell_phone: 'NaN'
            })

            # Parents Array, coditionally set
            parents = []
            parent1_account = Account.new({
                first_name: row['parent.1.account.name']&.rpartition(' ')&.first,
                last_name: row['parent.1.account.name']&.rpartition(' ')&.last,
                cell_phone: row['parent.1.account.cell_phone'],
                other_phone: row['parent.1.account.other_phone'],
                home_phone: row['parent.1.account.home_phone'],
                email: row['parent.1.account.email']
            })
            parent2_account = Account.new({
                first_name: row['parent.2.account.name']&.rpartition(' ')&.first,
                last_name: row['parent.2.account.name']&.rpartition(' ')&.last,
                cell_phone: row['parent.2.account.cell_phone'],
                other_phone: row['parent.2.account.other_phone'],
                home_phone: row['parent.2.account.home_phone'],
                email: row['parent.2.account.email']

            })

            parent1 = Parent.new(account: parent1_account)
            parent2 = Parent.new(account: parent2_account)

            # if the parents have a first name, lets log it
            parent1.account.first_name? ? parents << parent1 : false
            parent2.account.first_name? ? parents << parent2 : false

            emergency_contacts = []

            ec1 = EmergencyContact.new({name:row['student.emergency_contacts.2.name'],phone:row['student.emergency_contacs.2.phone']})
            ec2 = EmergencyContact.new({name:row['student.emergency_contacts.1.name'],phone:row['student.emergency_contacs.1.phone']})

            ec1.name != nil ? emergency_contacts << ec1 : false 
            ec2.name != nil ? emergency_contacts << ec2 : false 

            student_forms = StudentForm.new({
                filed: (row['student.filed'] != nil ? true : false),
                off_campus_permission:(row['student.student_forms.off_campus_permission'] != nil ? true : false),
                release_and_indemnification: (row['student.student_forms.release_and_indemnification'] != nil ? true : false),
                witness:(row['student.student_forms.witness'] != nil ? true : false),
                year: Date.new(Time.now.year)
            })
            student = {
                camp: Camp.where("name like ? or nickname like ?", "%"+row['camp']+"%", "%"+row['camp']+"%").first,
                account: student_account,
                parents:parents,
                gender: row['student.gender'],
                emergency_contacts: emergency_contacts,
                student_forms:[student_forms]
            }
            s = Student.create(student)

            puts "#{s.account.first_name} #{s.account.last_name} could not be saved - #{s.errors.full_messages}" if s.errors.any?

            student_counter += 1 if s.persisted?
            parent_counter += s.parents.length if s.persisted?
        end

        puts "Imported #{student_counter} students, #{parent_counter} parents"

    end

end