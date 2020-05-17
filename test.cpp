#include <WINDOWS.H>    
#include <stdio.h>
#include <math.h>
#include <malloc.h>


void cec20_test_func(double *, double *,int,int,int);
int main();

double *OShift,*M,*y,*z,*x_bound;
int ini_flag=0,n_flag,func_flag,*SS;

int main()
{
	int i,j,k,n,m,func_num;
	double *f,*x;
	FILE *fpt;
	char FileName[30];
	m=1;
	n=2;
	x=(double *)malloc(m*n*sizeof(double));
	f=(double *)malloc(sizeof(double) * m);
    func_num = 2;

    for (int i = 0; i < n; i++)
    {
        x[i] = 0;
    }

    cec20_test_func(x, f, n, m, func_num);
    for (j = 0; j < m; j++)
    {
        printf(" f%d(x[%d]) = %lf,", func_num, j+1, f[j]);
    }
    printf("\n");
	
	free(x);
	free(f);
	free(y);
	free(z);
	free(M);
	free(OShift);
	free(x_bound);
}


