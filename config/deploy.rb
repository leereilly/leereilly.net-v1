############################
# Based on the original DreamHost deploy.rb recipe
#
#
# GitHub settings #######################################################################################
default_run_options[:pty] = true
set :repository,  "git@github.com:leereilly/leereilly.net.git" #GitHub clone URL
set :scm, "git"
set :scm_username, "lee@leereilly.net"
#set :branch, "master"
set :scm_verbose, true
#set :deploy_via, :remote_cache
#set :git_shallow_clone, 1
set :use_sudo, false

#########################################################################################################
set :user, 'lreilly' #Dreamhost username
set :domain, 'leereilly.net'  # Dreamhost servername where your account is located 
set :project, 'leereilly.net'  # Your application as its called in the repository
set :application, 'leereilly.net'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup

# Don't change this stuff, but you may want to set shared files at the end of the file ##################
# deploy config
set :deploy_to, applicationdir
set :deploy_via, :remote_cache

# roles (servers)
role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
 [:start, :stop, :restart, :finalize_update, :migrate, :migrations, :cold].each do |t|
   desc "#{t} task is a no-op with mod_rails"
   task t, :roles => :app do ; end
 end
end

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys
#set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false

#########################################################################################################

#for use with shared files (e.g. config files)
after "deploy:update_code" do
  run "ln -s #{shared_path}/database.yml #{release_path}/config"
  run "ln -s #{shared_path}/environment.rb #{release_path}/config"
end

# default_run_options[:pty] = true
# 
# def sanity_check(wait,msg)
#   puts "*****************************************************************"
#   puts msg
#   puts "*****************************************************************"
#   (0..wait).to_a.each do |iteration|
#     sleep 0.33
#     print "#{wait - iteration}"
#     sleep 0.33
#     print " "
#     sleep 0.33
#     print " "
#   end
#   sleep 0.66
#   puts ""
# end
# 
# def oooh_matrixy
#   puts"             state       service"
#   puts"  22/tcp     open        ssh"
#   puts""
#   puts"  No exact OS matches for host"
#   puts""
#   puts"  nmap run completed -- 1 IP address (1 host up) scanneds"
#   puts"  % sshnuke 10.2.2.2 -rootpw-\"Z1ON0101\""
#   puts"  Connecting to 10.2.2.2:ssh ... successful."
#   puts"  Attempting to exploit SSHv1 CRC32 ... successful."
#   puts"  Reseting root password to \"Z1ON0101\"."
#   puts"  System open: Access Level (9)"
#   puts"  % ssh 10.2.2.2 -l root"
#   puts"  root@10.2.2.2's password: "
#   puts""
#   puts"  RTF-CONTROL> disable grid nodes 21 - 48"
#   puts"  Warning: Disabling nodes 21-48 will disconnect sector 11 (27 nodes)"
#   puts""
#   puts"          ARE YOU SURE ? (y/n)"
#   puts""
#   puts"  Grid Node 21 offline..."
#   puts"  Grid Node 22 offline..."
#   puts"  Grid Node 23 offline..."
#   puts"  Grid Node 24 offline..."
#   puts"  Grid Node 25 offline..."
#   puts"  Grid Node 26 offline..."
#   puts"  Grid Node 27 offline..."
#   puts"  Grid Node 28 offline..."
#   puts"  Grid Node 29 offline..."
#   puts"  Grid Node 30 offline..."
#   puts"  Grid Node 31 offline..."
#   puts"  Grid Node 32 offline..."
#   puts"  Grid Node 33 offline..."
#   puts"  Grid Node 34 offline..."
#   puts"  Grid Node 35 offline..."
#   puts"  Grid Node 36 offline..."
#   puts"  Grid Node 37 offline..."
#   puts"  Grid Node 38 offline..."
#   puts"  Grid Node 39 offline..."
#   puts"  Grid Node 40 offline..."
#   puts"  Grid Node 41 offline..."
#   puts"  Grid Node 42 offline..."
#   puts"  Grid Node 43 offline..."
#   puts"  Grid Node 44 offline..."
#   puts"  Grid Node 45 offline..."
#   puts"  Grid Node 46 offline..."
#   puts"  Grid Node 47 offline..."
#   puts"  Grid Node 48 offline..."
# end
# 
# role :web, "leereilly.net"                    # Your HTTP server, Apache/etc
# role :app, "leereilly.net"                    # This may be the same as your `Web` server
# role :db,  "leereilly.net", :primary => true  # This is where Rails migrations will run
# role :db,  "leereilly.net"
# 
# set :scm, "git"
# set :repository,  "git@github.com:leereilly/leereilly.net.git"
# set :deploy_to, "/home/lreilly/leereilly.net"
# set :application, "leereilly.net"
# set :user, 'lreilly'
# 
# set :scm_username, "lreilly"
# set :scm_passphrase, "Yaw_182" #This is the passphrase for the ssh key on the server deployed to
# set :branch, "master"
# set :scm_verbose, true
# 
# # set(:scm_username) do
# #    Capistrano::CLI.ui.ask "Enter your Github username: "
# # end
# # 
# # set(:scm_password) do
# #      Capistrano::CLI.password_prompt "Password: "
# # end
# 
# namespace :deploy do
#   namespace :production do
#     desc "A task to install the current version of the site on Github => production "
#     task :install_from_github do
#       sanity_check(5, "Installing latest version of leereilly.net from Github")
#       oooh_matrixy
#       proceed = Capistrano::CLI.ui.ask("Are you sure you want to install? (y/n): ")
#       if ['Y','y','yes','YES','Aye'].include?(proceed)
#         update
#       else
#         puts "Installation aborted"
#       end
#      end
#    end
#  end