# Make sure the architecture sets right
set architecture aarch64

# Use compiled and linked kernel ELF to provide symbols for GDB
file output/kernel.elf

# Remotely connect to QEMU exposed GDB
target remote localhost:9999

# when quiting gdb - quit the qemu (quitq is now an alias)
define quitq
    monitor quit
    quit
end

# Break on entry point, -S flag in QEMU holding the CPU before first breakpoint, continue to start
break _start