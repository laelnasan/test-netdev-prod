---
layout: session
title: SRv6 Network Programming in Linux Kernel
label: Nuts and Bolts
authors:
  - Stefano Salsano
  - Reshma Sudarshan
  - Daniel Bernier
contents:
  - type: video
    href: #
---

The Segment Routing over IPv6 (SRv6) Network Programming framework enables a
network operator or an application to specify a packet processing program by
encoding a sequence of instructions in the IPv6 packet header. The SRv6 Network
Programming framework is standardized in IETF RFC8986.

SRv6 has been supported in the Linux kernel since its introduction at IETF. The
very first support of SRv6 in the Linux kernel was introduced in release 4.10
(almost 6 years old now) [1]. 

Since then, SRv6 support in the Linux kernel has been getting more mature with
almost each kernel release. New features, bug fixes and performance improvement
patches are getting merged in the Linux kernel over time. An excerpt of SRv6
related patches submitted to the Linux kernel over the last years is shown in
[2]. Currently, the Linux kernel supports most of the SRv6 Network programming
behaviors defined in IETF RFC8986. 

SRv6 leverages the lightweight tunnel of the Linux Kernel. It defines two new
lightweight tunnels names seg6 and seg6local. The SRv6 support extends to other
sub-systems including Netfilter, eBPF, and others. 

The mature support of SRv6 in the Linux kernel has enabled many use-cases.
Indeed, many open-source stacks has been updated to support SRv6 and leverage
the SRv6 support in the Linux kernel. These stacks include FRR, Cilium, and
SONiC. 

- FRR currently supports several SRv6 features including L3VPN services. These
  services leverage the SRv6 dataplane (encapsulation and decapsulation)
  behaviors supported in the Linux kernel. The SRv6 support in FRR is across
  several daemons including Zebra, BGP, SHARP. 
- Cilium provides a SRv6-based container networking leveraging the Linux kernel
  eBPF framework. The SRv6 extension Cilium aims to support telco networking
  requirements in a cloud-native way.
- SONiC is an open-source network operating system (NOS) based on Linux. SONiC
  builds up on the SRv6 support in the Linux and FRR to provide a scalable
  solution for routing services and policies [3].

In the workshop we would like to give an update to the netdev community on the
SRv6 support in the Linux Kernel. We will review the supported SRv6 features,
and associated iproute2 extension, starting from kernel 4.10 up to now. Also,
we will provide an update on some new SRv6 features that we plan to contribute
to the Linux Kernel. In addition, we will review the supported SRv6 features in
FRR along with some interesting SRv6 control plane features that we plan to
submit to FRR. Moreover, we will give an update on the SRv6 activities in Linux
related open-source stacks such as SONiC and Cilium. 

### References
--------------

[1] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=1ababeba4a21f3dba3da3523c670b207fb2feb62

[2] https://lore.kernel.org/netdev/?q=%22seg6%22

[3] https://github.com/sonic-net/SONiC/blob/master/doc/srv6/srv6_hld.md
