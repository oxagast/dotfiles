#!/usr/bin/perl
$howmany = `cat /proc/cpuinfo | grep vendor_ | wc -l`;
chomp($howmany);
$speed = `cat /proc/cpuinfo | grep \"model name\" | awk \'\{print \$NF\}\' | head -n 1`;
chomp($speed);
$memfree = `free -h | head -n 2 | awk '{print \$4}' | tail -n 1`;
$memtotal = `free -h | head -n 2 | awk '{print \$2}' | tail -n 1`;
$uptime = `uptime | cut -d ',' -f 1 | sed -e 's/^ //'`;
$ethio = `~/Code/wormulon-0.1.3/wormulon -i eth0`;
chomp($vpnio);
chomp($uptime);
chomp($memfree);
chomp($memtotal);
print "$howmany CPUs @ $speed - $memfree/$memtotal Free - $uptime - $ethio";
