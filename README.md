GSGuise
=======

[iOS] 64-bit ID generator for distributed system which is optimized for mobile.

Designdoc
===

* Should save time information / time series.
* Can be stored in 64bit int.

Bit layout
---

* timestmap - 31 bit 
  1. Truncate millisecond. 
  2. Start from 2014.01.01 00:00 UST
  3. (Will overflow in 69 years)
* device token - 28 bit
* sequence - 5 bit
