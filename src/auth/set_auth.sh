#!/bin/bash
if [ ! -f "$dbpath"/.auth_set ]; then
echo "Creating user in MongoDB..."
mongo admin --eval "db.createUser({user: '$admin_user', pwd: '$admin_pwd', roles:[{role: 'root', db: 'admin'}]});"
if [ "$database" != "" ]; then
    mongo admin -u $admin_user -p $admin_pwd --eval "db.createUser({user: '$db_user', pwd: '$db_pwd', roles:[{role: 'dbOwner', db: '$database'}]});"
fi
echo "MongoDB configured."
touch "$dbpath"/.auth_set
fi
