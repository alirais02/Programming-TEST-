
#include <stdio.h>

// Function to check if a number is prime
int isPrime(int n) {
    if (n <= 1) return 0;
    if (n <= 3) return 1;
    if (n % 2 == 0 || n % 3 == 0) return 0;

    for (int i = 5; i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0) return 0;
    }
    return 1;
}

// Function to find the largest prime less than n
int findLargestPrime(int n) {
    for (int i = n - 1; i >= 2; i--) {
        if (isPrime(i)) return i;
    }
    return -1;
}

// Function to minimize the number of bottles needed
void minimizeBottles(int x) {
    int bottleCapacities[] = {29, 23, 19}; // Prime capacities in decreasing order
    int numBottles[3] = {0}; // Number of bottles for each capacity

    for (int i = 0; i < 3 && x > 0; i++) {
        numBottles[i] = x / bottleCapacities[i];
        x %= bottleCapacities[i];
    }

    printf("Number of bottles needed:\n");
    for (int i = 0; i < 3; i++) {
        printf("Capacity %d: %d bottles\n", bottleCapacities[i], numBottles[i]);
    }
}

int main() {
    int requiredWater;

    printf("Enter the required amount of water (between 100 and 10000000): ");
    scanf("%d", &requiredWater);

    if (requiredWater < 100 || requiredWater > 10000000) {
        printf("Invalid input.\n");
        return 1;
    }

    int largestPrime = findLargestPrime(30);
    if (largestPrime == -1) {
        printf("No prime number found in the given range.\n");
        return 1;
    }

    if (requiredWater < largestPrime) {
        printf("The required amount of water is less than the largest prime capacity.\n");
        return 1;
    }

    minimizeBottles(requiredWater);

    return 0;
}
