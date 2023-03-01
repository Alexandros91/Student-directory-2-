require_relative './cohort'
require_relative './student'

class CohortRepository

  def find_with_students(id)
    sql = 'SELECT cohorts.id AS "id",
          cohorts.name AS "cohort_name",
          cohorts.starting_date AS "starting_date",
          students.id AS "student_id",
          students.name AS "student_name"
          FROM cohorts
          JOIN students
          ON students.cohort_id = cohorts.id
          WHERE cohorts.id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    first_record = resut_set[0]

    cohort = record_to_cohort_object(first_record)

    result_set.each do |record|
      cohort.students << record_to_student_object(record)
    end

    return cohort
  end

  private

  def record_to_cohort_object(record)
    cohort = Cohort.new
    cohort.id = record['id'].to_i
    cohort.name = record['cohort_name']
    cohort.starting_date = record['starting_date']
    cohort.students = []

    return cohort
  end

  def record_to_student_object(record)
    student = Student.new
    student.id = record['student_id'].to_i
    student.name = record['student_name']

    return student
  end
end