# matrix-synapse-community.sh
*Extremely* simple script to directly manipulate the postgresql database in a matrix-synapse server to move every user from a room directly into a community. The admin API seems to be pretty busted as far as community stuff goes (community stuff in general seems pretty busted) so I wrote this simple script just to move people around on my (small) server. 


# How-to:
1.) Enter location of chatroom (the full !FEAVtear4qt4q:server.fake address), making sure to add a \ before it to escape the !. 
2.) Enter the name of the group you want the people in the chatroom added to. 
3.) Press enter.


# **Use at your own risk!!!** 
I definitely already messed up some stuff in my database making it, I can imagine you could easily do some serious database damage, especially on a 
