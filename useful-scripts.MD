### Use tmux to run remote program through ssh
If you do run a program over ssh then once you close the SSH, all processes created by SSH will be closed also!
One way to go around that is to use tmux sessions. 
1- Create tmux session 
```
tmux new-session -s tcpdump-session
```

2- Run the program on that session
```
# inside tmux session
tcpdump -w test.pcap
```

3- Detach from that session (press CTL+B then D)

4- Close the SSH, and the process will continue working

5- Connect again thourgh SSH, list tmux session, and attach to the previous session.
```
tmux list-sessions
```

6- Check that the process is still running. 
```
tmux attach -t tcpdump-session
```

### SSH forwarding 
connect port 80 on intra.example.com to port 1880 on gw.example.com. Such that if you it is web service then you can open run it as if it is running inside intra.example.com on port 80 (while in fact it is in gw.example.com on port 1880). 
```
ssh -L 80:intra.example.com:1880 gw.example.com
```
This is useful when connecting to database that its port only accessable to localhost (no remote access to database). SSH will work as if it is accessing the database locally and forward it securely to the remote host for admin. 

However, still anyone now can access port 80 on intra.example.com. To bind it to local access only. 
```
ssh -L 127.0.0.1:80:intra.example.com:1880 gw.example.com
```
