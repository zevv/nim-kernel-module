
proc printk*(str: cstring) {.header: "linux/printk.h", varargs, importc: "printk"}
