//
//  main.m
//  arm_study
//
//  Created by XFB on 2021/4/22.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "arm.h"

int globalA = 10;

int func (int a, int b) {
    printf("Hello");
    return a + b + globalA;
}

int main(int argc, char * argv[]) {
    
//    NSString * appDelegateClassName;
//    @autoreleasepool {
//        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
#if 0
        // test函数
        test();
        
        // add函数
        NSLog(@"%d", add(2, 3));
        
        // sub函数
        NSLog(@"%d", sub(8, 5));
        
        // 反汇编 需要用到iDA
        func(10, 20);
    
#endif

        int a = 10;
        int b = 20;
        if (a > b) {
            printf("a > b");
        } else {
            NSLog(@"a < b");
        }

//    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
    return 0;
}


#if 0

arm_study`main:
// 读写数据往高地址读写
// 拉伸栈空间48个字节 3*16 = 48
// sp = sp - 0x30 让sp减小 48个字节 以16字节对齐
0x1047d6140 <+0>:   sub    sp, sp, #0x30             ; =0x30
// 将sp往上加 2*16 = 32个字节，存放 x29 和 x30 这两个寄存器 （x29 和 x30）入栈
// [sp, #0x20]= [sp + #0x20] 代表一块内存区域（内存地址）【sp这个指针偏移 0x20 字节】
0x1047d6144 <+4>:   stp    x29, x30, [sp, #0x20]
// x29 = sp + 0x20
0x1047d6148 <+8>:   add    x29, sp, #0x20            ; =0x20
// 将零寄存器xzr（wzr）寄存器 也就是0 存入 x29-0x4 的内存地址
0x1047d614c <+12>:  stur   wzr, [x29, #-0x4]

// 下面两句将 w0(x0) 和 x1 放入栈中（入栈）
// 将w0 寄存器存入 x29-0x8的内存地址 栈中
// 将x1寄存器 存入 sp + 0x10的内存地址 栈中
0x1047d6150 <+16>:  stur   w0, [x29, #-0x8]
0x1047d6154 <+20>:  str    x1, [sp, #0x10]

// 将0xa 10 赋值给 w8寄存器
0x1047d6158 <+24>:  mov    w8, #0xa
// 将w8寄存器的值 保存在 sp+0xc 的内存地址中
0x1047d615c <+28>:  str    w8, [sp, #0xc]
// 将0x14 也就是20 赋值给 w8
0x1047d6160 <+32>:  mov    w8, #0x14
// w8的值20 存入到 sp + 0x8 的内存地址中
0x1047d6164 <+36>:  str    w8, [sp, #0x8]
// 取出 sp + 0xc 中内存地址的数据 赋值给 w8
0x1047d6168 <+40>:  ldr    w8, [sp, #0xc]
// 取出 sp + 0x8 所在内存地址的数据 赋值给 w9
0x1047d616c <+44>:  ldr    w9, [sp, #0x8]
// 比较w8 和 w9 存入cpsr中
0x1047d6170 <+48>:  cmp    w8, w9

// 将cpsr中 NZCV 位数据 和 le less equal 小于等于的位比较 判断是否符合然后调整到 0x1047d6188
0x1047d6174 <+52>:  b.le   0x1047d6188               ; <+72> at main.m
// adrp 是arm架构少生成汇编指令的原因
// 1、adrp => address page 将1的值向左移动12位 1 0000 0000 0000 -> 0x1000
// 2、将PC寄存器的低12位清零
// 3、将1和2 的结果相加 给x0寄存器
// adrp是计算指定的数据地址 到当前PC值的相对偏移量
// 由于得到的结果是低12bit位，这12位bit是来帮忙计算偏移地址 4KB
// 找常量所在的内存地址，就是x0所指向4KB的内存空间里面，
0x1047d6178 <+56>:  adrp   x0, 1
// x0 = x0 + #0x75
0x1047d617c <+60>:  add    x0, x0, #0xf75            ; =0xf75
// print打印
0x1047d6180 <+64>:  bl     0x1047d64f0               ; symbol stub for: printf
// 跳转到 0x1047d6194
0x1047d6184 <+68>:  b      0x1047d6194               ; <+84> at main.m

// 0x1047d6188 如果条件符合 跳转到这里执行指令
// 2 左移 12位 adrp编译的时候确定
0x1047d6188 <+72>:  adrp   x0, 2
0x1047d618c <+76>:  add    x0, x0, #0x28             ; =0x28
// NSLog打印
0x1047d6190 <+80>:  bl     0x1047d6490               ; symbol stub for: NSLog

// 0x1047d6194 执行 w8 = #0x0
0x1047d6194 <+84>:  mov    w8, #0x0
// x8 = x0
0x1047d6198 <+88>:  mov    x0, x8
// 将sp+0x20 内存地址取出值赋值给 x29和x30 寄存器
0x1047d619c <+92>:  ldp    x29, x30, [sp, #0x20]

// 栈平衡一下 sub sp, sp 之前开始减去，现在加回来
0x1047d61a0 <+96>:  add    sp, sp, #0x30             ; =0x30

0x1047d61a4 <+100>: ret

#endif







#if 0


hopper 里面汇编  iDA 没有安装成功
; ================ B E G I N N I N G   O F   P R O C E D U R E ================
             _main:
// 函数调用
0000000100006244         sub        sp, sp, #0x30
0000000100006248         stp        x29, x30, [sp, #0x20]
000000010000624c         add        x29, sp, #0x20

0000000100006250         movz       w8, #0x0

// 将wzr、w0、x1 放入栈里面
0000000100006254         stur       wzr, [x29, #-0x4]
0000000100006258         stur       w0, [x29, #-0x8]
000000010000625c         str        x1, [sp, #0x10]

0000000100006260         movz       w0, #0xa
0000000100006264         movz       w1, #0x14
0000000100006268         str        w8, [sp, #0xc]
000000010000626c         bl         _func
0000000100006270         ldr        w8, [sp, #0xc]
0000000100006274         mov        x0, x8
0000000100006278         ldp        x29, x30, [sp, #0x20]
000000010000627c         add        sp, sp, #0x30
0000000100006280         ret

_func:
00000001000061f8         sub        sp, sp, #0x20                               ; CODE XREF=_main+40
00000001000061fc         stp        x29, x30, [sp, #0x10]
0000000100006200         add        x29, sp, #0x10
0000000100006204         stur       w0, [x29, #-0x4]
0000000100006208         str        w1, [sp, #0x8]
000000010000620c         adrp       x0, #0x100007000                            ; argument #1 for method imp___stubs__printf
0000000100006210         add        x0, x0, #0xf7d                              ; "Hello"
0000000100006214         bl         imp___stubs__printf
0000000100006218         ldur       w8, [x29, #-0x4]
000000010000621c         ldr        w9, [sp, #0x8]
0000000100006220         add        w8, w8, w9
0000000100006224         adrp       x10, #0x10000d000
0000000100006228         add        x10, x10, #0x550                            ; _globalA
000000010000622c         ldr        w9, x10
0000000100006230         add        w8, w8, w9
0000000100006234         mov        x0, x8
0000000100006238         ldp        x29, x30, [sp, #0x10]
000000010000623c         add        sp, sp, #0x20
0000000100006240         ret

#endif
