
import linuxapi
import strutils

type
  Pig = object
    front: string
    back: int

proc test_strings() =
  echo repeat("Cat", 3)
  echo parseInt("1234")
  echo toHex("abcdefg")

proc test_dollars() =
  let a = [ 1, 2, 3 ]
  let b = @[ 1, 2, 3 ]
  let c = 12345
  let d = Pig(front: "pink", back: 40)
  echo $a
  echo $b
  echo $c
  echo $d
  echo 3.1415

proc nim_init(): cint {.cdecl, exportc.} = 
  echo "Hello"
  test_strings()
  test_dollars()


proc nim_exit() {.cdecl, exportc.} = 
  echo "Bye"


{.emit:"""
#include <linux/module.h>
module_init(nim_init)
module_exit(nim_exit)
MODULE_AUTHOR("Zevv");
MODULE_DESCRIPTION("Linux kernel module in Nim");
MODULE_LICENSE("MIT");
"""}

