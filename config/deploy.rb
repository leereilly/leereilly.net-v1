default_run_options[:pty] = true

def sanity_check(wait,msg)
  puts "*****************************************************************"
  puts msg
  puts "*****************************************************************"
  (0..wait).to_a.each do |iteration|
    sleep 0.33
    print "#{wait - iteration}"
    sleep 0.33
    print " "
    sleep 0.33
    print " "
  end
  sleep 0.66
  puts ""
end

def oooh_matrixy
  puts"             state       service"
  puts"  22/tcp     open        ssh"
  puts""
  puts"  No exact OS matches for host"
  puts""
  puts"  nmap run completed -- 1 IP address (1 host up) scanneds"
  puts"  % sshnuke 10.2.2.2 -rootpw-\"Z1ON0101\""
  puts"  Connecting to 10.2.2.2:ssh ... successful."
  puts"  Attempting to exploit SSHv1 CRC32 ... successful."
  puts"  Reseting root password to \"Z1ON0101\"."
  puts"  System open: Access Level (9)"
  puts"  % ssh 10.2.2.2 -l root"
  puts"  root@10.2.2.2's password: "
  puts""
  puts"  RTF-CONTROL> disable grid nodes 21 - 48"
  puts"  Warning: Disabling nodes 21-48 will disconnect sector 11 (27 nodes)"
  puts""
  puts"          ARE YOU SURE ? (y/n)"
  puts""
  puts"  Grid Node 21 offline..."
  puts"  Grid Node 22 offline..."
  puts"  Grid Node 23 offline..."
  puts"  Grid Node 24 offline..."
  puts"  Grid Node 25 offline..."
  puts"  Grid Node 26 offline..."
  puts"  Grid Node 27 offline..."
  puts"  Grid Node 28 offline..."
  puts"  Grid Node 29 offline..."
  puts"  Grid Node 30 offline..."
  puts"  Grid Node 31 offline..."
  puts"  Grid Node 32 offline..."
  puts"  Grid Node 33 offline..."
  puts"  Grid Node 34 offline..."
  puts"  Grid Node 35 offline..."
  puts"  Grid Node 36 offline..."
  puts"  Grid Node 37 offline..."
  puts"  Grid Node 38 offline..."
  puts"  Grid Node 39 offline..."
  puts"  Grid Node 40 offline..."
  puts"  Grid Node 41 offline..."
  puts"  Grid Node 42 offline..."
  puts"  Grid Node 43 offline..."
  puts"  Grid Node 44 offline..."
  puts"  Grid Node 45 offline..."
  puts"  Grid Node 46 offline..."
  puts"  Grid Node 47 offline..."
  puts"  Grid Node 48 offline..."
end

role :web, "leereilly.net"                    # Your HTTP server, Apache/etc
role :app, "leereilly.net"                    # This may be the same as your `Web` server
role :db,  "leereilly.net", :primary => true  # This is where Rails migrations will run
role :db,  "leereilly.net"

set :scm, "git"
set :repository,  "git@github.com:leereilly/leereilly.net.git"
set :deploy_to, "/home/lreilly/leereilly.net"
set :application, "leereilly.net"
set :user, 'lreilly'

set(:scm_username) do
   Capistrano::CLI.ui.ask "Enter your Github username: "
end

set(:scm_password) do
     Capistrano::CLI.password_prompt "Password: "
end

namespace :deploy do
  namespace :production do
    desc "A task to install the current version of the site on Github => production "
    task :install_from_github do
      sanity_check(5, "Installing latest version of leereilly.net from Github")
      oooh_matrixy
      proceed = Capistrano::CLI.ui.ask("Are you sure you want to install? (y/n): ")
      if ['Y','y','yes','YES','Aye'].include?(proceed)
        update
      else
        puts "Installation aborted"
      end
     end
   end
 end