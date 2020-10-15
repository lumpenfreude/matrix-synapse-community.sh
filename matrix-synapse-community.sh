#!/bin/bash
echo "enter name of room \(escape the \!):"
read chatroom
echo "enter group name:"
read group

sudo -u postgres -H -- psql -d synapse -c "SELECT user_id FROM users_in_public_rooms WHERE room_id = '$chatroom'" > trs.sql

cat trs.sql | while read line
do
        if [[ ${line:0:1} == "@" ]]; then
                sudo -u postgres -H -- psql -d synapse -c "INSERT INTO group_users (group_id, user_id, is_admin, is_public) VALUES ('$group', '$line', false, true);"
        fi
done
