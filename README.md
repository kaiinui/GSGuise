Guise
=======

[iOS] 64-bit ID generator for distributed system which is optimized for mobile.

Designdoc
===

* Should save time information / time series.
* Can be stored in 64bit int.

Bit layout
---

#### Item id (64 bit)

* device shard token - 10 bit
* timestmap - 41 bit 
  2. Start from 2014.01.01 00:00 UST
  3. (Will overflow in 69 years)
* sequence - 12 bit (safe for 4096 id generating / millisecond)

#### Device id (64 bit)

* timestamp - 41 bit
* sequence - 32 bit
