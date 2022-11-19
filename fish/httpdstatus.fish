function httpdstatus
  ansible $argv -m shell -a "service httpd status | grep active"
end
