//
//  main.m
//  switch
//
//  Created by XFB on 2021/4/23.
//

#import <UIKit/UIKit.h>

void funcA(int a) {
    switch (a) {
        case 1:
            printf("左侧");
            break;
            
        case 2:
            printf("右侧");
            break;
        
        case 3:
            printf("中间");
            break;
        
        default:
            break;
    }
}



int main(int argc, char * argv[]) {
    funcA(2);
    return 0;
}



#if 0

switch`main:
    0x1004ae190 <+0>:  sub    sp, sp, #0x30             ; =0x30
    0x1004ae194 <+4>:  stp    x29, x30, [sp, #0x20]
    0x1004ae198 <+8>:  add    x29, sp, #0x20            ; =0x20
    0x1004ae19c <+12>: mov    w8, #0x0
    0x1004ae1a0 <+16>: stur   wzr, [x29, #-0x4]
    0x1004ae1a4 <+20>: stur   w0, [x29, #-0x8]
    0x1004ae1a8 <+24>: str    x1, [sp, #0x10]
    0x1004ae1ac <+28>: mov    w0, #0x2
    0x1004ae1b0 <+32>: str    w8, [sp, #0xc]
    0x1004ae1b4 <+36>: bl     0x1004ae110               ; funcA at main.m:10
->  0x1004ae1b8 <+40>: ldr    w0, [sp, #0xc]
    0x1004ae1bc <+44>: ldp    x29, x30, [sp, #0x20]
    0x1004ae1c0 <+48>: add    sp, sp, #0x30             ; =0x30
    0x1004ae1c4 <+52>: ret


switch`funcA:

    // 开辟栈空间 拉伸32个字节
    0x1004ae110 <+0>:   sub    sp, sp, #0x20             ; =0x20
    // 将 寄存器x29 和 x30 存入到 sp 偏移0x10 得内存地址中
    // 读写是往高地址读写
    0x1004ae114 <+4>:   stp    x29, x30, [sp, #0x10]
    // x29 = sp + 0x10
    0x1004ae118 <+8>:   add    x29, sp, #0x10            ; =0x10
    
    // 将w0的值 存入到x29 - 0x4 的内存地址 只存4个字节
    0x1004ae11c <+12>:  stur   w0, [x29, #-0x4]
    // 将x29 - 0x4的内存地址中取值 存入到w8中
    0x1004ae120 <+16>:  ldur   w8, [x29, #-0x4]
    // w8-0x1 是否等于
    0x1004ae124 <+20>:  cmp    w8, #0x1                  ; =0x1
    // w8存入到 sp + 0x8的内存地址
    0x1004ae128 <+24>:  str    w8, [sp, #0x8]

    0x1004ae12c <+28>:  b.eq   0x1004ae154               ; <+68> at main.m
    0x1004ae130 <+32>:  b      0x1004ae134               ; <+36> at main.m
    0x1004ae134 <+36>:  ldr    w8, [sp, #0x8]
    // w8-0x2 是否等于
    0x1004ae138 <+40>:  cmp    w8, #0x2                  ; =0x2

    0x1004ae13c <+44>:  b.eq   0x1004ae164               ; <+84> at main.m
    0x1004ae140 <+48>:  b      0x1004ae144               ; <+52> at main.m
    0x1004ae144 <+52>:  ldr    w8, [sp, #0x8]
    // w8-0x3 是否等于
    0x1004ae148 <+56>:  cmp    w8, #0x3                  ; =0x3

    0x1004ae14c <+60>:  b.eq   0x1004ae174               ; <+100> at main.m
    0x1004ae150 <+64>:  b      0x1004ae184               ; <+116> at main.m:27:1

    // 如果相等 0x1004ae154
    0x1004ae154 <+68>:  adrp   x0, 1
    0x1004ae158 <+72>:  add    x0, x0, #0xf7d            ; =0xf7d
    0x1004ae15c <+76>:  bl     0x1004ae504               ; symbol stub for: printf
    0x1004ae160 <+80>:  b      0x1004ae184               ; <+116> at main.m:27:1

    // 如果相等 0x1004ae164
    0x1004ae164 <+84>:  adrp   x0, 1
    0x1004ae168 <+88>:  add    x0, x0, #0xf84            ; =0xf84
    0x1004ae16c <+92>:  bl     0x1004ae504               ; symbol stub for: printf
    0x1004ae170 <+96>:  b      0x1004ae184               ; <+116> at main.m:27:1

    // 如果相等 0x1004ae174
    0x1004ae174 <+100>: adrp   x0, 1
    0x1004ae178 <+104>: add    x0, x0, #0xf8b            ; =0xf8b
    0x1004ae17c <+108>: bl     0x1004ae504               ; symbol stub for: printf
    0x1004ae180 <+112>: b      0x1004ae184               ; <+116> at main.m:27:1

    // 将[sp + 0x10]内存地址的值取出存入 x29 和 x30
    0x1004ae184 <+116>: ldp    x29, x30, [sp, #0x10]
    // 栈平衡
    0x1004ae188 <+120>: add    sp, sp, #0x20             ; =0x20
    0x1004ae18c <+124>: ret

#endif

