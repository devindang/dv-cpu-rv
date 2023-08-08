# dv-cpu-rv

RISC-V based CPU.

## Feature

1. RISC-V based.

2. Five-stage pipelined architecture:

   IF(Instruction Fetch) => ID(Instruction Decode) => EX(Execute) => MEM(Memory Access) => WB(Write Back)

3. 2-bit dynamic branch prediction.

4. Supported ISA extended by RISC-V:

- [ ] RV32I, RV64I
- [ ] RV32M, RV64M
- [ ] RV32F, RV64F

## Design Guide

The detailed design documentation is provided. [./docs/dv-cpu-doc.pdf](https://github.com/devindang/dv-cpu-rv/blob/main/docs/assembly.md)

## Simulation

1. install `riscv64-linux-gnu-gcc`;

2. make alias:

   ```sh
   alias rvgcc="riscv64-linux-gnu-gcc"
   alias rvobjdump="riscv64-linux-gnu-objdump"
   ```

3. compile `c` file to obtain assembly codes:

   ```sh
   rvgcc file.c -S [file.s]
   ```

4. use objdump to obtain machine codes:

   ```sh
   rvobjdump -S file.c
   ```

Or, use online translater:

https://riscvasm.lucasteske.dev/

### 1. Modelsim

```sh
cd ./core/vsim
vsim -do sim.do
```

### 2. VCS+Verdi

```sh
cd ./core/sim
make all
```

## Examples

Examples to simulation related to commits are discribed in the file [./docs/assembly.md](https://github.com/devindang/dv-cpu-rv/blob/main/docs/assembly.md)

## Reference

[1] Patterson, David. "Computer organization and design RISC-V edition" (2017).

## Developing...
