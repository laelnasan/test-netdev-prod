---
title: "It's Time to Replace TCP in the Datacenter"
authors:
  - John Ousterhout

author_details: Stanford University
author_photo: <p><img src="../../img/keynote-john-ousterhout.png" alt="The keynote speaker John Ousterhout's face" /></p>
contents:
  - type: slides
    href: ../../keynote/netdev0x16-keynote.pdf
  - type: video
    href: https://bit.ly/netdev-0x16-keynote
---


Although TCP is a tremendously successful transport protocol that has survived 40 years of dramatic technology changes, virtually every aspect of its design is wrong for the datacenter. This talk will discuss the problems with TCP, ranging from its use of connections and streams to its mechanisms for reliable delivery and congestion control.

If we are to make significant headway against the "datacenter tax" we must move most datacenter traffic to a new and fundamentally different protocol. I will then discuss how the Homa transport protocol solves all of the problems of TCP and suggest a migration strategy for bringing a TCP alternative into widespread usage. Finally, I will discuss my experiences implementing Homa in the Linux kernel.

I will argue that it no longer makes sense to implement network transport protocols in software. Instead, transport protocols must move to NIC hardware. This will likely require the development of a new architecture for NICs.

