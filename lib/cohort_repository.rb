class CohortRepository

  def find_with_students(id)
    sql = 'SELECT cohorts.id AS id,
          cohorts.name AS cohort_name,
          cohorts.starting_date AS starting_date
          FROM cohorts
          JOIN students
          ON students.cohort_id = cohorts.id
          WHERE cohorts.id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    result_set.each do |record|
      p record
    end
    # cohort = Cohort.new
    # cohort.id =

  end
end