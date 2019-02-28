#import <Foundation/Foundation.h>

int main (int argc, const char *agrv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog (@"hello world");
    [pool drain];
    return 0;
}