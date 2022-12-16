require 'cohort_repository'

RSpec.describe CohortRepository do
  def reset_cohorts_table
    seed_sql = File.read('spec/seeds_cohorts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_cohorts_table
  end

  describe '#find_with_students' do
    it 'finds a cohort with the array ofr students in it' do
      repo = CohortRepository.new

      cohort = repo.find_with_students(1)
      expect(cohort.id).to eq 1
      expect(cohort.name).to eq 'April 22'
      expect(cohort.starting_date).to eq '04/20/2022'
      expect(cohort.students.length).to eq 2
      expect(cohort.students.first.name).to eq 'Mike Tyson'
    end
  end
end