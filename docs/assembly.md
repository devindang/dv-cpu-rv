#### 1. Given two numbers, add them and store into memory.

##### C code

```c
#include "stdio.h"
int main() {
	int a = 14;
	int b = 15;
	int c;
	c = a + b;
	return 0;
}
```


##### Assembly code

```assembly
addi x2 x0 14;	//0//	00000000111000000000000100010011
addi x3 x0 15;	//1//	00000000111100000000000110010011
add  x1 x2 x3;	//2//	00000000001100010000000010110011
sd   x1 16(x2);	//3//	00000000000100010011010000100011
```

#### 2. Given a non-zero natural number N, calculate the sum of natural numbers less than N.

##### C code

```c
#include "stdio.h"
int main() {
	int N = 10;
	int sum = 0;
	for(int i=1; i<N; i++){
		sum = sum+i;
	}
	return 0;
}
```

##### Assembly code

```assembly
addi x1 x0 10;	//0//	00000000101000000000000010010011
addi x2 x0 1;	//4//	00000000000100000000000100010011
addi x3 x0 0;	//8//	00000000000000000000000110010011
add  x3 x2 x3;	//12//	00000000001100010000000110110011
addi x2 x2 1;	//16//	00000000000100010000000100010011
blt  x2 x1 A12;	//20//	11111110000100010100110011100011
sd   x3 16(x1);	//24//	00000000001100001011010000100011
```

> In RISC-V, the offset of ***beq*** represent the number of halfwords between the branch and the branch target, which is singed.

