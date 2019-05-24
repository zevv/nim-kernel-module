
{.push stack_trace: off, profiler:off.}

import linuxapi

proc rawoutput(s: string) =
  printk("%s\n", s)

proc panic(s: string) =
  printk("PANIC: %s", s[0].unsafeAddr)

{.pop.}
