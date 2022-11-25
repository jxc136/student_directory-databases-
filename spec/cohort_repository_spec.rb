require 'cohort_repository'

def reset_cohorts_table
  seed_sql = File.read('spec/seeds_cohorts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_two' })
  connection.exec(seed_sql)
end

describe CohortRepository do
  before(:each) do 
    reset_cohorts_table 
  end

  it 'finds the cohort with the related students' do 
    repo = CohortRepository.new

    cohorts = repo.find_with_students(1) 
    
    expect(cohorts.name).to eq 'April'
    expect(cohorts.starting_date).to eq '2022-04-01'
    expect(cohorts.students.first.name).to eq 'David'
    expect(cohorts.students.first.cohort_id).to eq  '1'
    
  end 

 

end
  
