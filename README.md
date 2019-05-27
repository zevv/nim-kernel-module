
Experiment to create a Linux kernel module in nim

Requires a slightly changed Nim compiler with support for the `kernel` os:
https://github.com/zevv/Nim/tree/linux-kernel


 
```
make
sudo insmod nimhello.ko
sudo rmmod nimhello
```

