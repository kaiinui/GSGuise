Guise
=======

[iOS] 64-bit ID generator for distributed system which is optimized for mobile.

Designdoc
===

* Should save time information / time series.
* Can be stored in 64bit int.

Bit layout
---

* timestmap - 41 bit 
  2. Start from 1 January 2001, GMT
* sequence - 12 bit (safe for 4096 id generating / millisecond)
* shard token - 10 bit

Spec
---

```objc
describe(@"GSGuise", ^{
    describe(@"+gid", ^{
        unsigned long long int gid = [GSGuise gid];
        
        it(@"Should not return same value as before", ^{
            expect([GSGuise gid]).notTo.equal(gid);
        });
        
        it(@"Should be larger than former value after millisecond wait", ^{
            sleep(0.001);
            expect([GSGuise gid]).to.beGreaterThan(gid);
        });
        
        it(@"mod is always same", ^{
            int mod = 8;
            expect([GSGuise gid] % mod).to.equal(gid % mod);
        });
    });
});

```
