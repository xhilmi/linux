cat <<EOF > mysql-config.sh
#!/bin/bash

# Define the configuration file path
config_file="/etc/mysql/mysql.conf.d/mysqld.cnf"

# Check if the configuration file exists
if [ -f "\$config_file" ]; then
    # Use sed to comment out the existing bind-address lines and set them to 0.0.0.0
    sed -i 's/^bind-address/#bind-address/g' "\$config_file"
    sed -i 's/^mysqlx-bind-address/#mysqlx-bind-address/g' "\$config_file"
    echo "bind-address = 0.0.0.0" >> "\$config_file"
    echo "mysqlx-bind-address = 0.0.0.0" >> "\$config_file"
    echo "Configuration updated successfully."
else
    echo "MySQL configuration file not found: \$config_file"
fi
EOF
