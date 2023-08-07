# Todo

### 7/24-7/30

- [x] pipelined

- [x] data hazrd - forwarding
  - question at p579
  
- [x] control hazard

  > if an ALU instruction immediately preceding a branch produces the operand for the test in the conditional branch, a stall will be required, since the EX stage for the ALU instruction will occur after the ID cycle of the branch. By extension, if a load is immediately followed by a conditional branch that depends on the load result, two stall cycles will be needed, as the result from the load appears at the end of the MEM cycle but is needed at the beginning of ID for the branch.

- [x] branch is so late in pipeline that the later instruction is executed, how to solve?

  > This will be solved by branch prediction.

### 7/31-8/6

- [x] dynamic branch prediction

### 8/7-8/13

- [ ] M extension
- [ ] F extension
- [ ] exceptions
- [ ] cache
- [ ] memory?


### 8/14-8/20

- [ ] dma
- [ ] ahb/apb

