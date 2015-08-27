namespace :import do

  desc "imports user data from a csv file"
  task :users => :environment do
    require 'csv'
    CSV.foreach('importData/users.csv') do |row|
      provider = row[0]
      uid = row[1]
      name = row[2]
      email = uid
      password = "password"
      puts row.inspect
      puts "Provider: ", provider,"uid: ",uid,"Name: ",name, "email", email
      #@user = User.create(provider: provider, uid: uid, name: name, encrypted_password: password, email: email)
      @user = User.create(provider: provider, uid: uid, encrypted_password: password, email: email)
      @user.save!(options={validate: false})
      puts "user.provider = ", @user.provider
    end
  end

  desc "clears user data"
  task :clear_users => :environment do
    User.destroy_all
  end

  desc "imports canvas_lookup data from a csv file"
  task :canvas_lookups => :environment do
    require 'csv'
    CSV.foreach('importData/canvas_lookup.csv') do |row|
        canvas_id = row[0]
        object_file_id = row[1]
        puts row.inspect
        puts "CanvasId: " + canvas_id + " image_id: " + object_file_id
        @canvasLookup = CanvasLookup.create(canvas_id: canvas_id, object_file_id: object_file_id)
        @canvasLookup.save!(options={validate: false})
        puts "canvasLookup.canvas_id = ", @canvasLookup.canvas_id

    end
  end



end