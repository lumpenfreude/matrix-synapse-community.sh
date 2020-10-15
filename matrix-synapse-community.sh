#!/bin/bash
echo "enter full name of room (found in the sharing link):"
read chatroom
echo "enter group name (i.e. +fakegroup:fakeserver.fake):"
read group
sudo -u postgres -H -- psql -d synapse -c "SELECT user_id FROM users_in_public_rooms WHERE room_id = '$chatroom'" > group.sql
less -FX group.sql
echo -n "Does this look correct? (y/n)"
read answer
echo "adding all members of $chatroom to $group"
if [ $answer != "${answer#[Yy]}" ]; then
        cat group.sql | while read line
        do
                if [[ ${line:0:1} == "@" ]]; then
                        sudo -u postgres -H -- psql -d synapse -c "INSERT INTO group_users (group_id, user_id, is_admin, is_public) VALUES ('$group', '$line', false, true);"
                fi
        done
else
        exit N
fi
