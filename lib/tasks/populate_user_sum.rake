namespace :db do
  desc "Seed the karma sum of each user"
  task :pop_karma_sum => :environment do
    seed_karma_sum
  end

  def seed_karma_sum
    User.all.each do |user|
      user.update_attribute(:karma_sum, user.total_karma)
      puts "#{user.id}/100,000 done." if user.id%1000 == 0
    end
  end

end




# namespace :pick do
#   desc "Pick a random user as the winner"
#   task :winner => :environment do
#     puts "Winner: #{pick(User).name}"
#   end

#   desc "Pick a random product as the prize"
#   task :prize => :environment do
#     puts "Prize: #{pick(Product).name}"
#   end

#   desc "Pick a random prize and winner"
#   task :all => [:prize, :winner]

#   def pick(model_class)
#     model_class.find(:first, :order => 'RAND()')
#   end
# end