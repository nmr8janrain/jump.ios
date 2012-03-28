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


#import "JRLanguagesSpoken.h"

@implementation JRLanguagesSpoken
{
    NSInteger _languagesSpokenId;
    NSString *_languageSpoken;
}
@dynamic languagesSpokenId;
@dynamic languageSpoken;

- (NSInteger)languagesSpokenId
{
    return _languagesSpokenId;
}

- (void)setLanguagesSpokenId:(NSInteger)newLanguagesSpokenId
{
    [self.dirtyPropertySet addObject:@"languagesSpokenId"];

    _languagesSpokenId = newLanguagesSpokenId;
}

- (NSString *)languageSpoken
{
    return _languageSpoken;
}

- (void)setLanguageSpoken:(NSString *)newLanguageSpoken
{
    [self.dirtyPropertySet addObject:@"languageSpoken"];

    if (!newLanguageSpoken)
        _languageSpoken = [NSNull null];
    else
        _languageSpoken = [newLanguageSpoken copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/profiles/profile/languagesSpoken";
    }
    return self;
}

+ (id)languagesSpoken
{
    return [[[JRLanguagesSpoken alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JRLanguagesSpoken *languagesSpokenCopy =
                [[JRLanguagesSpoken allocWithZone:zone] init];

    languagesSpokenCopy.languagesSpokenId = self.languagesSpokenId;
    languagesSpokenCopy.languageSpoken = self.languageSpoken;

    return languagesSpokenCopy;
}

+ (id)languagesSpokenObjectFromDictionary:(NSDictionary*)dictionary
{
    JRLanguagesSpoken *languagesSpoken =
        [JRLanguagesSpoken languagesSpoken];

    languagesSpoken.languagesSpokenId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    languagesSpoken.languageSpoken = [dictionary objectForKey:@"languageSpoken"];

    return languagesSpoken;
}

- (NSDictionary*)dictionaryFromLanguagesSpokenObject
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    if (self.languagesSpokenId)
        [dict setObject:[NSNumber numberWithInt:self.languagesSpokenId] forKey:@"id"];

    if (self.languageSpoken && self.languageSpoken != [NSNull null])
        [dict setObject:self.languageSpoken forKey:@"languageSpoken"];
    else
        [dict setObject:[NSNull null] forKey:@"languageSpoken"];

    return dict;
}

- (void)updateLocallyFromNewDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"id"])
        _languagesSpokenId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];

    if ([dictionary objectForKey:@"languageSpoken"])
        _languageSpoken = [dictionary objectForKey:@"languageSpoken"];
}

- (void)replaceLocallyFromNewDictionary:(NSDictionary*)dictionary
{
    _languagesSpokenId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    _languageSpoken = [dictionary objectForKey:@"languageSpoken"];
}

- (void)updateObjectOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"languagesSpokenId"])
        [dict setObject:[NSNumber numberWithInt:self.languagesSpokenId] forKey:@"id"];

    if ([self.dirtyPropertySet containsObject:@"languageSpoken"])
        [dict setObject:self.languageSpoken forKey:@"languageSpoken"];

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

    [dict setObject:[NSNumber numberWithInt:self.languagesSpokenId] forKey:@"id"];
    [dict setObject:self.languageSpoken forKey:@"languageSpoken"];

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
    [_languageSpoken release];

    [super dealloc];
}
@end
