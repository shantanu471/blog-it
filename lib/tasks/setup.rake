desc 'drops the db, creates db, migrates db and populates sample data'
task setup: [:environment, 'db:drop', 'db:create', 'db:migrate'] do
  Rake::Task['populate_with_sample_data'].invoke if Rails.env.development?
end

task populate_with_sample_data: [:environment] do
  if Rails.env.production?
    puts "Skipping deleting and populating sample data in production"
  else
    create_sample_data!
    puts "Sample data has been added."
  end
end

def create_sample_data!
  puts 'Seeding with sample data...'

  org1 = create_organization!(name: 'MicroRecepton Labs')
  org2 = create_organization!(name: 'Rex Industries')

  create_user!(email: 'oliver@example.com', username: 'Oliver', organization_id: org1.id)
  create_user!(email: 'sam@example.com', username: 'Sam', organization_id: org2.id)

  puts 'Done! Now you can login with either "oliver@example.com" or "sam@example.com", using password "welcome4712"'
  puts "Oliver belongs to organization: #{org1.name}"
  puts "Sam belongs to organization: #{org2.name}"
end

def create_organization!(options = {})
  Organization.create! options
end

def create_user!(options = {})
  user_attributes = { password: 'welcome4712', password_confirmation: 'welcome4712' }
  attributes = user_attributes.merge options
  User.create! attributes
end
