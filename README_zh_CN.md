# dv-cpu-rv

[![rvlogo](./src/riscv.svg) RISC-V Exchange](https://riscv.org/exchange/?_sf_s=dv-cpu-rv) 

基于 [RISC-V](https://riscv.org/technical/specifications/) 架构的五级流水线哈弗结构 CPU.

英文版本的 README 在此处提供 [./README.md](https://github.com/devindang/dv-cpu-rv/blob/main/README.md)

## 特性

1. 基于优雅的开源指令集 RISC-V.

2. 使用 ITCM 和 DTCM 的哈弗架构.

3. 无数据冒险的五级流水线.

4. 双比特动态分支预测技术.

5. 基4 Booth-Wallace 乘法器.

6. 可变周期基 4 SRT 除法器.

7. 支持 RISC-V 扩展指令集:

- [x] RV32I, RV64I
- [x] RV32M, RV64M
- [ ] RV32F, RV64F

## 设计指导

本仓库提供了详细的设计文档 [./docs/dv-cpu-doc_zh_CN.pdf](https://github.com/devindang/dv-cpu-rv/blob/main/docs/design/dv-cpu-doc_zh_CN.pdf)

部分详细的设计方案 (中文简体版本) 发布在了我的博客. [cnblog:devindd](https://www.cnblogs.com/devindd/)

## 仿真

1. 安装 `riscv64-linux-gnu-gcc`;

2. 设置别名:

   ```sh
   alias rvgcc="riscv64-linux-gnu-gcc"
   alias rvobjdump="riscv64-linux-gnu-objdump"
   ```

3. 编译 `c` 文件获得汇编代码:

   ```sh
   rvgcc file.c -S [file.s]
   ```

4. 使用 objdump 获得机器代码:

   ```sh
   rvobjdump -S file.c
   ```

或者，使用在线的翻译器:

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

## 示例

和 Git 提交相对应的仿真示例在该文件中描述 [./docs/assembly.md](https://github.com/devindang/dv-cpu-rv/blob/main/docs/design/assembly.md)

## Reference

[1] Patterson, David. "Computer organization and design RISC-V edition" (2017).

[2] 胡伟武. 计算机体系结构基础. 第3版, 机械工业出版社, 2021. [链接](https://github.com/foxsen/archbase)

[3] Koren, Israel. "Computer arithmetic algorithms". CRC Press, 2018.

## 开源许可

Copyright (C) 2023 devin

本仓库使用 [GPLv3.0](https://www.gnu.org/licenses/gpl-3.0.en.html) 协议.

您可以重新分发并 (或) 修改该软件，前提是遵守免费软件基金会 (Free Software Foundation) 发布的 GNU General Public License，3.0 版本或更高。
