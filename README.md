# dv-cpu-rv

RISC-V based CPU.

Supported ISA extended by RISC-V:

- [ ] RV32I, RV64I
- [ ] RV32M, RV64M
- [ ] RV32F, RV64F

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

## Developing...
