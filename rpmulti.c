#include <stdio.h>

long long int rmultiply (long long int num1, long long int num2);
long long int multiply (long long int num1, long long int num2);

int main () {
    //Main menu
    printf("Please select which version you want to use:\n");
    printf("1. Recursive\n");
    printf("2. Non-recursive\n");
    printf("> ");
    int input;
    scanf("%d", &input);

    //User input
    long long int num1, num2;
    printf("Enter the first number: ");
    scanf("%lld", &num1);
    printf("Enter the second number: ");
    scanf("%lld", &num2); 
    printf("\n");
    
    switch (input) {
        case 1:
            //Calculate recursively
            printf("%lld * %lld = %lld\n", num1, num2, rmultiply(num1, num2));
            break;     
        case 2:
            //Calculate non-recursively
            printf("%lld * %lld = %lld\n", num1, num2, multiply(num1, num2));
            break;
    }
    
    return 0;
}

//Algorithm as per the assignment outline
long long int rmultiply (long long int num1, long long int num2) {
    if (num1 == 0 || num1 == 1) {
        return (num1 == 0 ? num1 : num2);
    } else /*if (num1 > 1)*/ {
        //Cases 3 and 4 of the algorithm are the same except the `+ num2` in case 4
        long rVal = rmultiply((num1 / 2), (2 * num2));
        return (num1 % 2 == 0 ? rVal : rVal + num2);
    }
}

//Non-recursive multiplication algorithm
long long int multiply (long long int num1, long long int num2) {
    if (num1 == 0 || num1 == 1) return (num1 == 0 ? num1 : num2);

    long long int rVal = 0;
    while (num2 > 0) {
        if (num2 % 2 != 0) rVal += num1;
        num1 += num1;
        num2 = num2 / 2;
    }

    return rVal;
}

