#### 1. Gicen two numbers, add them and store into memory.

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
addi x2 x0 14;
addi x3 x0 15;
add  x1 x2 x3;
sd   x1 16(x2);
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
addi x2 x0 1;
addi x3 x0 0;
add  x3 x2 x3;
jal	 x1 A4;
addi x2 x2 1;
blt  x2 x3 A6;
jalr x0 0(x1);
```

