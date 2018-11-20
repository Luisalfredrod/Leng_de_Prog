#include "cuda_runtime.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define THREADS_PER_BLOCK 512
#define BLOCKS_PER_GRID 12

#define N 1000000
#define width 1.0 / N



__global__ void parallel_pi(double *sum){
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int id = index;

    while( id < N){ 
        //Variables declared to keep up with every thread
        double mid = (id + 0.5) * width;
        double height = 4.0 / (1.0 + mid * mid);
        sum[index] += height;
        id = id + blockDim.x * gridDim.x;
    }
}

void sequential_pi(){
    // Code given in the Cuda Material
    long num_rects = 100000, i;
    double mid, height, w, area;
    double sum = 0.0;
    w = 1.0 / (double) num_rects;
    for (i = 0; i < num_rects; i++) {
        mid = (i + 0.5) * w;
        height = 4.0 / (1.0 + mid * mid);
        sum += height;
   }
   area = w * sum;
   printf("Sequential Pi: %f\n",area);
}

int main(){
    double area = 0;
    double *d_s;
    double *sum;
    int size = THREADS_PER_BLOCK * BLOCKS_PER_GRID;
    
    
    sum = (double*) malloc(size * sizeof(double));

    cudaMalloc((void**) &d_s, size * sizeof(double));

    parallel_pi<<<BLOCKS_PER_GRID, THREADS_PER_BLOCK>>>(d_s);

    cudaMemcpy(sum, d_s, size * sizeof(double), cudaMemcpyDeviceToHost);

    for (int i = 0; i < size; i++) {
        area += sum[i];
    }
    area = area * width;

    printf("Multithread Pi: %f\n", area);
    sequential_pi();


    free(sum);
    cudaFree(d_s);



    return 0;
}