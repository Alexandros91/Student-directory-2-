require 'cohort_repository'

RSpec.describe CohortRepository do
  def reset_student_and_cohort_table
    seed_sql = File.read('spec/seeds_student_directory_2.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_student_and_cohort_table
  end

  describe '#find_with_students' do
    it 'finds the cohort with related students' do
      repo = CohortRepository.new
      cohort = repo.find_with_students(1)

      expect(cohort.name).to eq 'April 22'
      expect(cohort.starting_date).to eq '2022/04/20'
      expect(cohort.students.length).to eq 1
      expect(cohort.students.first.id).to eq '2'
      expect(cohort.students.first.name).to eq 'Serena Williams'
    end
  end
end