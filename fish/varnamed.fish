function varnamed
  ansible cpanel -m shell -a "ls -lah /var/named | grep '$argv'"
end
