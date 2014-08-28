#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "GSGuise.h"

@interface GSGuise ()
+ (int)shard;
+ (unsigned long long int)sequence;
@end

SpecBegin(GSGuise)

describe(@"GSGuise", ^{
    describe(@"+shard", ^{
        int shard = [GSGuise shard];
        it(@"Should return same value as before.", ^{
            expect([GSGuise shard]).to.equal(shard);
        });
    });
    
    describe(@"+sequence", ^{
        unsigned long long int sequence = [GSGuise sequence];
        it(@"Should return random value", ^{
            expect([GSGuise sequence]).notTo.equal(sequence);
        });
    });
    
    describe(@"+gid", ^{
        unsigned long long int gid = [GSGuise gid];
        it(@"Should not return same value as before", ^{
            expect([GSGuise gid]).notTo.equal(gid);
        });
        
        it(@"Should be larger than former value", ^{
            sleep(0.1);
            expect([GSGuise gid]).to.beGreaterThan(gid);
        });
        
        it(@"mod is always same", ^{
            int mod = 8;
            expect([GSGuise gid] % mod).to.equal(gid % mod);
        });
    });
});

SpecEnd