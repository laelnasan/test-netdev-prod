---
title: P4TC Workshop
label: Nuts and Bolts
authors:
  - ANJALI JAIN
contents:
  - type: video
    href: #
---

This workshop will constitute discussions on the current kernel
effort to get P4 over TC. The first code release will happen at
the workshop.

Current WAG agenda:

1. Code Release and high level overview
2. P4C compiler Interaction
3. Control-user introspection
4. The test infrastructure being used to test P4TC
5. Driver interfaces Discussion
6. Any other discussions..

### Background
P4 has gained industry-wide acceptance as a datapath language
and has been a subject of many discussions in the community over
the last few years, see [1], [2], [3], [4], [5], [6]:

Due to the industry takeoff of P4 we are putting resources to make it real
for the Linux kernel.
Effort to write code has been going on for a few months and we hope
to release the code in this workshop.

Some of the stated P4TC goals are:

 1. Offloading entirely to P4-capable hardware with skip_sw.
 2. Running entirely in software infrastructures (VMs, baremetal, containers)
    with skip_hw.
 3. Split setup - where some of the P4 program control and pipeline is in
    software and some is in hardware (using a mix of skip_sw and skip_hw).
 4. Running multiple independent P4 programs across multiple independent
    hardware and/or software (using tc filter infrastructure).
 5. Independence from changing any kernel code with introduction of a
    new P4 program (achieved via "scriptability").

### References
----------------

[1] Matty Kadosh, "P4 Offload", TC Workshop, Netdev conference 2.2, 2017
https://legacy.netdevconf.info/2.2/slides/salim-tc-workshop04.pdf

[2] Prem Jonnalagadda, "Mapping tc to P4", TC Workshop, Netdev conference 2.2, 2017
https://legacy.netdevconf.info/2.2/slides/salim-tc-workshop06.pdf

[3]Jamal Hadi Salim, "What P4 Can Learn From Linux Traffic Control",
proceedings of ONF 5th P4 Workshop, 2018
https://opennetworking.org/wp-content/uploads/2020/12/Jamal_Salim.pdf

[4] Many speakers, TC P4 workshop, Intel, Santa Clara, 2018
https://files.netdevconf.info/d/5aa8c0ca61ea4e96bb46/

[5] Antonin Bas and R. Krishnamoorthy. "Instrumenting P4 in the Kernel",
TC Workshop, Netdev conference 0x12, 2018
https://www.files.netdevconf.info/d/9535fba900604dcd9c93/files/?p=/Instrumenting%20P4%20in%20the%20Linux%20kernel.pdf

[6] Marian Pritsak and Matty Kadosh, "P4 Compiler Backend for TC",
Netdev conference 0x13, 2019
https://legacy.netdevconf.info/0x13/session.html?p4-compiler-backend-for-tc
