
proc printk*(str: cstring) {.header: "linux/module.h", varargs, importc: "printk"}

proc print_modules*() {.header: "linux/module.h", importc: "print_modules"}
