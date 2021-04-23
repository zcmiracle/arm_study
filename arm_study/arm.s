//
//  arm.s
//  arm_study
//
//  Created by XFB on 2021/4/22.
//

; 汇编注释用; 最好不要用 //

; 声明代码段
.text

; 全局 公开给外界使用
.global _test, _add, _sub


blAddressJump:
mov x0, #0x1
mov x1, #0x2
add x2, x0, x1
ret


; test函数的实现
_test:


; bl 指令 - 类似函数调用
bl blAddressJump
mov x3, #0x3
mov x4, #0x4

; b 指令
; b addressJump
; mov x0, #0x5
; addressJump:
; mov x1, #0x3

; EQ    Z置位为1        相等
; NE    清零           不相等
; GT    Z清零且N=V      带符号数大于
; GE    N=V            带符号数大于或等于
; LT    N!=V           带符号数小于
; LE    Z置位或N!=V     带符号数小于或等于

; b 指令 - 带条件
; mov x0, #0x1
; mov x1, #0x3
; x0和x1值相减 放入cpsr中
; cmp x0, x1
; beq 去cpsr中查找Z位，则满足条件跳转到addressJump执行
; b.eq addressJump
; mov x0, #0x5
; 如果不符合，执行后直接ret跳出，不执行addressJump，只能执行一个
;ret
;addressJump:
;mov x1, #0x8



; cmp 指令
; mov x0, #0x5
; mov x1, #0x2
; cmp x0, x1

; mov 指令
; mov x0, #0x8
; mov x1, x0

; add 指令
; mov x0, #0x1
; mov x1, #0x2
; add x2, x0, x1

; sub 指令
; mov x0, #0x6
; mov x1, #0x2
; sub x2, x0, x1

ret


; add函数的实现
_add:
add x0, x0, x1
ret


; sub函数的实现
_sub:
sub x0, x0, x1
ret
