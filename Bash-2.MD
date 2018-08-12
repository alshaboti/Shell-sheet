## From talk by Dan North at GOTO conf from [here](https://www.youtube.com/watch?v=7uwW20odwEk)
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

### disk usage
```
du -sh  Desktop/ #s summary, h human terms
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
