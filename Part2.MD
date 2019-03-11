## Some from talk by Dan North at GOTO conf from [here](https://www.youtube.com/watch?v=7uwW20odwEk)
### Every thing is file in Unix
```
ls -l /dev/tty*
cwrt c for character device (stream)
ls -l /dev/sda*
bwrt b for block device 
```

each directory represnets process
```
ls /proc
```
Get current process ID
```
echo $$
ls /proc/$$
```

file discriptors 
```
ls /proc/$$/cmdline # how process starts
```
To kill a process you need its PID, so you may need to capture its PID when you create it. For example,
```
gedit && geditPID=$!
ps -p $!

# later kill gedit
kill $geditPID
```
To check which process this PID is. 
```
ps -p <processPID>
```

### process substitution use files to communicate
```
wc <(cat /usr/share/dict/american-english)
#   ^ no space between < and ( 
# output                   
# 123115  123115 1185564 /proc/self/fd/11
```
Can be used to compare the content of two dictionarires
```
 cat  <(ls) <(ls ../tmp2)
 echo <(ls) <(ls ../tmp2)
 diff <(ls) <(ls ../tmp2)
```
[See hre more](http://tldp.org/LDP/abs/html/process-sub.html)

## Special characters
### : character
```
# : is like true program
: && echo 1
# similar to 
true && echo 1
```
To empty a file
```
: > data.xxx   # File "data.xxx" now empty.	      

# Same effect as   cat /dev/null >data.xxx
```
To be used like pass in python
```
function f(){
:
}
# empty function with NOP inside
```
### * character
wildcard char to match any filename, if used with echo, it list current file names
```
echo *
echo .*

# like ls
```
### $! 
PID of the last program you run in the background exit code 
```
gedit &
echo $! # gedit PID
kill $! # or save it into variable to kill it later
```
### $?
Exit status of the last program you run
```
true && echo $?  # output is 0
false && echo $? # output is 1
```
### $0
path to the shell you are using
```
echo $0
# e.g. /usr/pkg/bin/zsh
```
### $$
return current process PID
as above
## Control 
```
Ctrl + p # Go back to previouse commands
Ctrl + A # go the begining of the current line
Ctrl + E # go to the end of the line
Ctrl + N # new command, earase the current line.
```
### Searching
```
find his* 
wc -l his.txt
grep -n word his.txt
grep '.*a.*e.*i.*o.*u' /usr/share/dict/british-english
```
sed stream editor, will not change the file contents. useful with pipelines
```
cat > test
hey hey hey
^D
sed 's/hey/hi/' test 
sed 's/hey/hi/g' test 
cat test # no changes 
```
Find and execute. 
```
# find the file and open it in vim, {} a place holder for the returned file from find.
find . -iname "somewherefile.java" -exec vim {} \;
```
Find all files that are readable by user1 (Useful for CTF). 
```
find / -user user1 -readable 2>/dev/null
```
### disk usage
```
du -sh  Desktop/ #s summary, h human terms
du -csbh . # total acual size of the current directory.
```
## disk free 
```
df -h -x tmpfs -T
```
 
### processes
```
ps 
pgrep -fl bash # grep  bash processes  id 
fuser . # who is using the current directory 
```
return file descriptor for a temporary output, not accessable as regular file, but shows how kernel deal with it.
```
<(cat test.txt)
echo <(cat test.txt)
less -f <(cat test.txt) # is show as a file, but it is just the output of cat !
```


## Reference 
[A full tutorial to Bash](http://www.tldp.org/LDP/abs/html/)
