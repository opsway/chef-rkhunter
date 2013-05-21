# various things rkhunter uses
%w{bsd-mailx unhide}.each do |pkg|
  package pkg do
    action :install
  end
end

package "rkhunter" do
  action :install
  notifies :run, "execute[rkhunter update]", :delayed
end

template "/etc/default/rkhunter" do
  source "debian-default.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :run, "execute[rkhunter update]", :delayed
end

template "/etc/rkhunter.conf.local" do
  source "rkhunter.conf.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :run, "execute[rkhunter update]", :delayed
end

template "/etc/apt/apt.conf.d/90rkhunter" do
  source "rkhunter.apt.erb"
  mode 0644
  owner "root"
  group "root"
end  

execute "rkhunter update" do
  command "/etc/cron.weekly/rkhunter"
  user "root"
  action :nothing
end

execute "rkhunter propupd" do
  command "rkhunter --propupd"
  user "root"
  action :nothing
end
