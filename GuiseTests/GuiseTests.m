#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "GSGuise.h"

@interface GSGuise ()
+ (int)shard;
@end

SpecBegin(GSGuise)

describe(@"GSGuise", ^{
    describe(@"+shard", ^{
        int shard = [GSGuise shard];
        it(@"Should return same value as before.", ^{
            expect([GSGuise shard]).to.equal(shard);
        });
    });
});

SpecEnd