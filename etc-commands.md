Linux helpful commands:
```
ps -aux
ps -efa 

netstat -tulpen
netstat -at  #only tcp
netstat -au #only udp
```
----------------------
routing table
```
netstat -rn  
# or 
route -n
```
Arp table
```
arp
```
-----------------
```
apt-cache search <keyword>
pkill -HUP -f process-name
```
-----------------------------------------
Linux network namespaces
Each namespace is isolated and they can be connected 
through veth (a tupe that have two end for connection)
source: https://www.youtube.com/watch?v=_WgUwUf1d34

create two ns and connect them using veth and test by ping
list available namespaces
```
ip netns list 

# create new namespace 
ip netns add green 
ip netns add red
```
creeate veth pair (it only created as pair)
```
ip link add veth0-red type veth peer name veth0-green

# add one end to green ns and the other to red ns
ip link set veth0-red netns red
ip link set veth0-green netns green
```
check interfaces at each netns through ip netns exec red/green <cmd> or
#ip netns exec green bash , which let you switch to green netns
  then use 
  #ip link list
  #ip link set veth0-green up 
  #ip address add 10.0.0.1/24 veth0-green 
  or simply use
  # ifconfig veth0-green 10.0.0.1/24 up , to replace the last two cmd
  # exit , to exit form green netns
do the same with blue with 10.0.0.2/24 instead. 

# ip netns exec red bash
# ping 10.0.0.2


more about net-tools
To remove all interface settings 
```
#ifconfig eth0 0
```
Only show up interfaces
```
#ifconfig 
```
shows all interfaces up or down
```
#ip link show  
```
Change mac address
```
#ifconfig eth0 hw ether AA:BB:CC:DD:EE:FF
```
set ip/masc and turn it on
```
#ifconfig eth0 10.0.0.1/24 up
```
show route table
```
# route
```
change default gw
```
# route del default gw 192.168.1.254 eth0
# route add default gw 192.168.1.254 eth0
```
after each steo restart network service
```
/etc/init.d/networking restart
```
--------------------
Check interface settings: IP/GW/DNS
```
nmcli dev show [<interfacename>] 
nmcli dev show (show all)
```
#status of each interface
```
nmcli dev
```
-----------------
tcpdump does not capture any packets or just few!!
9 packets captured
58 packets received by filter
43 packets dropped by kernel

(takes too much time to resolve hostname)
use -n option (don't resolve IPs to names), and option -B 
to increase buffer size in KB. Hopfully kernell will not drop any pakcets, 
if not use -c option and limit number of packets
```
sudo tcpdump -B 4096 -i enp2s0 -c 100 -n
```
or dump it to a file
```
sudo tcpdump -B 4096 -i enp2s0 -c 100 -n -w dumpfile.pcap
```
------------------------------------------------------------------------------
Create ssh keys for login remotely without password
in host A:
```
ssh-keygen -t rsa
press enter (keep password emtpy)
```
then copy /home/moh/.ssh/id_rsa.pub public key content 
Go to host B:
create authorized_keys file in .ssh folder (.ssh folder should have 700 permission)
past id_rsa.pub in it, then 
```
chmod 600 authorized_keys
```
DONE
You can know ssh or scp from A to B without any password prompet
-----------------------------
install from github #if setup.py is available 
 ```
 git clone https://github.com/username/packg
 cd packg
 sudo python setup.py install 
 ```
you need python-setuptools installed 
