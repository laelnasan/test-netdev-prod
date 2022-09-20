---
layout: session
title: Introduction to time synchronization
label: Nuts and Bolts
authors:
  - Maciek Machnikowski
contents:
  - type: video
    href: #
---

Now that we learned about the theoretical side of PTP on the previous NetDev -
let's get more practical!

Every year the demand for precise time synchronization grows. From 5G to data
centers - everyone wants to get down from milliseconds to microseconds and
beyond.

This tutorial introduces the practical side of time synchronization in Linux.
It goes over the tools in the linuxptp, chrony, and other helpful software that
makes the deployment of time synchronization easy and convenient.

It will start with a basic Leader-Follower setup, show the easiest way to bring
it up, and introduce different profiles and where to use them.

Then it will show how to deploy the basic GNSS-synchronized grandmaster setup
that anyone can build at home to start experimenting with time synchronization.

The talk will cover common pitfalls when deploying follower clocks (like mixing
link speeds that could result in an undetectable clock skew) along the way.

It will also show how to use PTP as a time source for the local NTP server
using chrony to show how existing NTP deployments can benefit from the much
more precise PTP.

In the end - it will also go over the latest improvement that enables
monitoring of a working PTP service.
