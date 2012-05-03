/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


#import "JRTags.h"

@implementation JRTags
{
    NSInteger _tagsId;
    NSString *_tag;
}
@dynamic tagsId;
@dynamic tag;

- (NSInteger)tagsId
{
    return _tagsId;
}

- (void)setTagsId:(NSInteger)newTagsId
{
    [self.dirtyPropertySet addObject:@"tagsId"];

    _tagsId = newTagsId;
}

- (NSString *)tag
{
    return _tag;
}

- (void)setTag:(NSString *)newTag
{
    [self.dirtyPropertySet addObject:@"tag"];

    if (!newTag)
        _tag = [NSNull null];
    else
        _tag = [newTag copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/profiles/profile/tags";
    }
    return self;
}

+ (id)tags
{
    return [[[JRTags alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JRTags *tagsCopy =
                [[JRTags allocWithZone:zone] init];

    tagsCopy.tagsId = self.tagsId;
    tagsCopy.tag = self.tag;

    return tagsCopy;
}

+ (id)tagsObjectFromDictionary:(NSDictionary*)dictionary
{
    JRTags *tags =
        [JRTags tags];

    tags.tagsId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    tags.tag = [dictionary objectForKey:@"tag"];

    return tags;
}

- (NSDictionary*)dictionaryFromTagsObject
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    if (self.tagsId)
        [dict setObject:[NSNumber numberWithInt:self.tagsId] forKey:@"id"];

    if (self.tag && self.tag != [NSNull null])
        [dict setObject:self.tag forKey:@"tag"];
    else
        [dict setObject:[NSNull null] forKey:@"tag"];

    return dict;
}

- (void)updateLocallyFromNewDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"id"])
        _tagsId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];

    if ([dictionary objectForKey:@"tag"])
        _tag = [dictionary objectForKey:@"tag"];
}

- (void)replaceLocallyFromNewDictionary:(NSDictionary*)dictionary
{
    _tagsId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    _tag = [dictionary objectForKey:@"tag"];
}

- (void)updateObjectOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"tagsId"])
        [dict setObject:[NSNumber numberWithInt:self.tagsId] forKey:@"id"];

    if ([self.dirtyPropertySet containsObject:@"tag"])
        [dict setObject:self.tag forKey:@"tag"];

    NSDictionary *newContext = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     self, @"captureObject",
                                                     delegate, @"delegate",
                                                     context, @"callerContext", nil];

    [JRCaptureInterface updateCaptureObject:dict
                                     withId:0
                                     atPath:self.captureObjectPath
                                  withToken:[JRCaptureData accessToken]
                                forDelegate:self
                                withContext:newContext];
}

- (void)replaceObjectOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:[NSNumber numberWithInt:self.tagsId] forKey:@"id"];
    [dict setObject:self.tag forKey:@"tag"];

    NSDictionary *newContext = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     self, @"captureObject",
                                                     delegate, @"delegate",
                                                     context, @"callerContext", nil];

    [JRCaptureInterface replaceCaptureObject:dict
                                      withId:0
                                      atPath:self.captureObjectPath
                                   withToken:[JRCaptureData accessToken]
                                 forDelegate:self
                                 withContext:newContext];
}

- (void)dealloc
{
    [_tag release];

    [super dealloc];
}
@end