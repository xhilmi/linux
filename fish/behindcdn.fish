function behindcdn
  ansible $argv -m shell -a "cat /etc/sysconfig/imunify360/imunify360.config | grep known_proxies_support"
end
