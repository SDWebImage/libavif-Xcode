//
//  main.m
//  libavifExample
//
//  Created by lizhuoli on 2019/4/14.
//  Copyright © 2019 SDWebImage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <libavif/libavif.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("%s", avifVersion());
    }
    return 0;
}
