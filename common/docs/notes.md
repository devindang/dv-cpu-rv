# Notes

## 需求

1. 五级流水
2. RISC-V 支持
3. PC relative addressing

## 解释

从 C 代码转换到汇编语言的过程可以使用 gcc 和 objdump 实现 [[reddit link]](https://www.reddit.com/r/RISCV/comments/qjs7g9/converting_c_code_to_risc_v/)



## 指令

P203 指令示例

P248 部分RISC-V指令table



register source 地址位宽为5，共32个。（寄存器号？）

immediate 位宽为12，

### arith

#### R-type

add	add

sub	substract

#### I-type

addi	add immediate

#### S-type

ld	load doubleword

sd	store doubleword

lb	load byte

sb	store byte

lh	load halfword

sh	store halfword

#### SB-type

bne	branch if not equal

#### UJ-type

jal	jump and link

#### unknown

lui	load upper immediate



### branches

beq	branch if equal

bne	branch if not equal

blt

bge

bltu

bgeu

> **extended:** ble, bgt can be synthesized by reversing the operand? risc-v manual v2.2 page 17



jal	jump and link

jalr	jump and link register



## 32 Registers in RISC_V

**x10–x17**: eight parameter registers in which to ==pass parameters or
return values==.

**x1**: one return address register to return to the point of origin.

**x2**: In RISC-V, the stack pointer is register x2, also known
by the name sp.

**x5−x7** and **x28−x31**: temporary registers that are not preserved by
the callee (called procedure) on a procedure call.

**x8−x9** and **x18−x27**: saved registers that must be preserved on a
procedure call (if used, the callee saves and restores them)

**x3**: some RISC-V compilers
reserve a register x3 for use as the global pointer, or gp.

**x8**: is also used as a frame pointer.

**x4**: thread pointer.

x0: the constant value 0



