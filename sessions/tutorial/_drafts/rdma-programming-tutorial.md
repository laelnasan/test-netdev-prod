---
layout: session
title: RDMA programming tutorial
label: Moonshot
authors:
  - Roland Dreier
  - Jason Gunthorpe
contents:
  - type: video
    href: #
---
This tutorial will introduce developers familiar with Linux networking to the Linux RDMA stack and how it can be used to implement high-performance communication for applications.  An outline of the proposed tutorial is:


* Key features of RDMA for high performance communication
  - Asynchronous work / completion queues
  - Kernel bypass
    - Transport offload from application CPUs, including reliability / retransmission
  - One-sided (and two-sided) ops
    - Send-receive vs RDMA read/write
    - Memory pre-registration / pinning
  - Transport
    - IB and RoCE
    - RoCE vs iWARP/TCP vs proprietary (eg AWS EFA)
    - RC vs UD
* Simple example application (RC pingpong)
  - Key objects: QP, CQ, MR
  - Register memory (extensions for accelerator memory, etc)
  - Connection establishment with IP addressing & librdmacm
  - Post work requests to send and receive work queues
  - Poll CQ
  - Compare with UD version
