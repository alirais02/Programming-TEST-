#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void form_smallest_number(char* sequence) {
    int digits[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    int result[10];
    int stack[9];
    int stack_top = -1;
    int digit_index = 0;

    for (int i = 0; sequence[i]; i++) {
        if (sequence[i] == 'M') {
            stack[++stack_top] = digits[digit_index++];
        } else if (sequence[i] == 'N') {
            result[i] = digits[digit_index++];
            while (stack_top >= 0) {
                result[stack_top + 1] = stack[stack_top--];
            }
        }
    }

    stack[++stack_top] = digits[digit_index++];

    while (stack_top >= 0) {
        result[stack_top + 1] = stack[stack_top--];
    }

    printf("Smallest possible number: ");
    for (int i = 0; i < strlen(sequence) + 1; i++) {
        printf("%d", result[i]);
    }
    printf("\n");
}

int main() {
    char sequence[9];
    printf("Enter the sequence (M and N): ");
    scanf("%s", sequence);

    if (strlen(sequence) <= 8) {
        int valid = 1;
        for (int i = 0; sequence[i]; i++) {
            if (sequence[i] != 'M' && sequence[i] != 'N') {
                valid = 0;
                break;
            }
        }

        if (valid) {
            form_smallest_number(sequence);
        } else {
            printf("Invalid input sequence. Please provide a valid sequence.\n");
        }
    } else {
        printf("Invalid input. Maximum length of sequence is 8 characters.\n");
    }

    return 0;
}
