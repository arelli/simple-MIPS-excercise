


#include <stdio.h>
#include <stdlib.h>

int R0=0, R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21;
int R22,R23,R24,R25,R26,R27,R28,R29,R30,R31;

int zero = 0, at,v0,v1,a0,a1,a2,a3,t0,t1,t2,t3,t4,t5,t6,t7,s0,s1,s2,s3,s4,s5,s6,s7,t8,t9;
int k0,k1,gp,sp,fp,ra;

int* givenArray;
int* retArray;

int func1(int R1){

    int z=0, i=0, j=0;

  	R2=z;
  	R3=i;
  	R14=j;

    before_while3:
    if (R3>=R1) goto after_while3;
        before_while4:
        if (R14>R3)goto after_while4;
            printf("%4d", R14+1);
            R14=R14+1;
            R2=R2+1;
        goto before_while4;
        after_while4:
        printf("\n ");
        R3=R3+1;
        R14=0;
    goto before_while3;
    after_while3:
    printf("\n ");
    return R2;
}

int func2(int R1){
    int R2 = 0;
    if (R1&1 == 1){
        return 1;
    }
    return R2;
}

int func3(int R1, int R2){

    int R3=0;//i
    printf("\n");
    before_while5:
    if(R3>=5) goto after_while5;//while(i<5)
        printf(" -Give integer n.%d: ", R3+1);
        scanf("%d", &(*((int*)R1+R3)));
        *((int*)R2+R3) = *((int*)R1+R3)+ *((int*)R1+R3)+ *((int*)R1+R3)+ *((int*)R1+R3)+ *((int*)R1+R3);
        R3=R3+1;
    goto before_while5;
    after_while5:
        printf("\n");
        return R2;
}

int main()
{
    givenArray  = (int*)malloc(5*sizeof(int));

    retArray = (int*)malloc(5*sizeof(int));

    int* mainArray = (int*)malloc(5*sizeof(int));

    int ret1, ret2;
    int n1,n2;
    int k = 0;
    int choice;

    R7 = (int)givenArray;
    R8 = (int)retArray;
    R9 = (int)mainArray;

    R1 = ret1;
    R2 = ret2;
    R3 = k;
    R4 = choice;
    R5 = n1;
    R6 = n2;

    before_while:
    if(!1) goto after_while;//while(1){ // if(0)
        before_choice:
        printf("\n ~~~~~HRY201-Lab3~~~~~~~~");
        printf("\n --------Menu------------");
        printf("\n 1. Function n.1---------");
        printf("\n 2. Function n.2---------");
        printf("\n 3. Function n.3---------");
        printf("\n 4. Exit-----------------");
        printf("\n ~~~~~~~~~~~~~~~~~~~~~~~~");
        printf("\n\n  Give your choice: ");
        scanf("%d", &R4);
		//switch(choice){
        if (R4 == 1){//case 1:
            printf("\n Give the number of rows you want for your Triangle ");
            printf(" \n        (if you want to exit give -1 or 0):        ");
            scanf("%d", &R5);
            printf("\n ");
            if (R5==-1 || R5==0){
                printf("\n  Program Finished!");
                return 0;
            }
            R1 = func1(R5);
            printf("\n  The number of printed values is: %d\n", R1);
        }
        if (R4 == 2){//case 2:
            printf("\n Give the number you want to check: ");
            scanf("%d", &R6);
            R2 = func2(R6);
            if (R2==0)
                printf("\n  --> The number is EVEN!\n");
            if (R2==1)
                printf("\n  --> The number is ODD!\n");
        }
        if (R4==3){//case 3:
            R9 = func3(R7, R8); // or R9 = func3((int*)R7, (int*)R8);
            before_while2:
            if(R3>=5) goto after_while2;
                printf("\n The number %d multiplied by five is equal to:  %d", *((int*)R7+R3),*((int*)R9+R3));
                R3++;
            goto before_while2;
            after_while2:
            printf("\n");
        }
        if (R4==4){//case 4:
            printf("\n Programm Finished!\n");
            exit(0);
        }
        if ( R4!=4 && R4!=2 && R4!=3 && R4!=1){ //|| choice-(float)choice!=0){
            printf("\n Choice not available! Try again!\n");
            goto before_choice;
        }
    goto before_while;
    after_while:
    return 0;
}
