## Use tmux to run remote program through ssh
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
