namespace :draft do
  desc "db reset all"
  task :db_reset => :environment do
    puts "reset db ... "
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    if Rails.env == 'development'
      puts "seed ..."
      Rake::Task['db:seed'].invoke
    end
    puts "done!"
  end
end