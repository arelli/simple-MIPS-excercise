


#include <stdio.h>
#include <stdlib.h>

int R0=0, R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21;
int R22,R23,R24,R25,R26,R27,R28,R29,R30,R31;

int zero = 0, at,v0,v1,a0,a1,a2,a3,t0,t1,t2,t3,t4,t5,t6,t7,s0,s1,s2,s3,s4,s5,s6,s7,t8,t9;
int k0,k1,gp,sp,fp,ra;

int* givenArray;
int* retArray;

int printTriangle(int a0){

    int z=0, i=0, j=0;

  	t0=z;
  	t1=i;
  	t9=j;//THIS was problematic, conflict with other registers after first loop

    before_while3:
    if (t1>=a0) goto after_while3;
        before_while4:
        if (t9>t1)goto after_while4;
            printf("%4d", t9+1);
            t9=t9+1;
            t0=t0+1;
        goto before_while4;
        after_while4:
        printf("\n ");
        t1=t1+1;
        t9=0;
    goto before_while3;
    after_while3:
    printf("\n ");
    v0=t0;//t0 is not preserved after the return of the function
    return v0;
}// better comments on this are in the assembly file

int checkNumber(int a0){
    int v0 = 0;
    if (a0&1 == 1){
        return 1;
    }
    return v0;
}

int multiplier(int a0, int a1){

    int t0=0;//i
    printf("\n");
    before_while5:
    if(t0>=5) goto after_while5;//while(i<5)
        printf(" -Give integer n.%d: ", t0+1);
        scanf("%d", &(*((int*)a0+t0))); //TODO: convert one-line addition to multiline
        *((int*)a1+t0) = *((int*)a0+t0)+ *((int*)a0+t0)+ *((int*)a0+t0)+ *((int*)a0+t0)+ *((int*)a0+t0);
        t0=t0+1;
    goto before_while5;
    after_while5:
        printf("\n");
	v0=a1; //a1 register is NOT preserved on subprograms(deleted after the function returns)
        return v0; //by convention, the return value is passed through v0 and v1
}

int main()
{
    givenArray  = (int*)malloc(5*sizeof(int));//TODO: allocate space in .data section

    retArray = (int*)malloc(5*sizeof(int)); //TODO: allocate space in .data section

    int* mainArray = (int*)malloc(5*sizeof(int)); //TODO: allocate space in .data section

    int ret1, ret2;
    int n1,n2;
    int k = 0;
    int choice;

    t6 = (int)givenArray;
    t7 = (int)retArray;
    t8 = (int)mainArray;

    t0 = ret1;
    t1 = ret2;
    t2 = k;
    t3 = choice;
    t4 = n1;
    t5 = n2;

    before_while:
    if(!1) goto after_while;
        before_choice:
        printf("\n ~~~~~HRY201-Lab3~~~~~~~~");
        printf("\n --------Menu------------");
        printf("\n 1. Print Triangle-------");
        printf("\n 2. Check Number---------");
        printf("\n 3. Array Multiplier-----");
        printf("\n 4. Exit-----------------");
        printf("\n ~~~~~~~~~~~~~~~~~~~~~~~~");
        printf("\n\n  Give your choice: ");
        scanf("%d", &t3);
	
        if (t3 == 1){
            printf("\n Give the number of rows you want for your Triangle ");
            printf(" \n        (if you want to exit give -1 or 0):        ");
            scanf("%d", &t4);
            printf("\n ");
            if (t4==-1 || t4==0){
                printf("\n  Program Finished!");
                return 0;
            }
            t0 = printTriangle(t4); //t4 should be $a0 in assembly
            printf("\n  The number of printed values is: %d\n", t0);
        }
        if (t3 == 2){
            printf("\n Give the number you want to check: ");
            scanf("%d", &t5);
            t1 = checkNumber(t5); //t5 should be $a0 in assembly
            if (t1==0)
                printf("\n  --> The number is EVEN!\n");
            if (t1==1)
                printf("\n  --> The number is ODD!\n");
        }
        if (t3==3){
            t8 = multiplier(t6, t7); // t6 and t7 should be $a0 and $a1 in assembly
            before_while2:
            if(t2>=5) goto after_while2;
                printf("\n The number %d multiplied by five is equal to:  %d", *((int*)t6+t2),*((int*)t8+t2));
                t2++;
            goto before_while2;
            after_while2:
            printf("\n");
        }
        if (t3==4){
            printf("\n Programm Finished!\n");
            exit(0);
        }
        if ( t3!=4 && t3!=2 && t3!=3 && t3!=1){ //|| choice-(float)choice!=0){
            printf("\n Choice not available! Try again!\n");
            goto before_choice;
        }
    goto before_while;
    after_while:
    return 0;
}
