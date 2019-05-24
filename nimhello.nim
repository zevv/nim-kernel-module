
import linuxapi


proc square(a: int): int =
  return a * a


proc nim_init(): cint {.cdecl, exportc.} = 
  var a = 42
  var b = a.square
  printk("Hello from Nim\n")
  printk("%d squared is %d\n", a, b)
  return 0


proc nim_exit() {.cdecl, exportc.} = 
  printk("Byte from Nim\n")


{.emit:"""

#include <linux/module.h>

module_init(nim_init)
module_exit(nim_exit)

MODULE_AUTHOR("Zevv");
MODULE_DESCRIPTION("Linux kernel module in Nim");
MODULE_LICENSE("MIT");
"""}

