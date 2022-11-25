require_relative './cohort'
require_relative './student'

class CohortRepository

  def find_with_students(cohort_id)

    sql = 'SELECT cohorts.id AS "id", cohorts.name AS "cohort_name", cohorts.starting_date AS "starting_date",
          students.id AS "student_id",
          students.name,
          students.cohort_id AS "cohort_id"
    FROM cohorts
    	JOIN students
    	ON students.cohort_id = cohorts.id
    WHERE cohorts.id = $1;'

    params = [cohort_id]

    result_set =  DatabaseConnection.exec_params(sql, params)
    
    record = result_set[0]

    cohort = Cohort.new
    cohort.id = record['id']
    cohort.name = record['cohort_name']
    cohort.starting_date = record['starting_date']
    cohort.students = []
    
    result_set.each do |record|
      student = Student.new
      student.id = record['student_id']
      student.name = record['name']
      student.cohort_id = record['cohort_id']

      cohort.students << student
    end 
   
    return cohort

  end

end 