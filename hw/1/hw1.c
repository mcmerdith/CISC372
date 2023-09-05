#include <stdlib.h>
#include <stdio.h>

// get the position of a row,col pair in a matrix
int get_matrix_position(int n_cols, int row, int col)
{
    return col + (row * n_cols);
}

// constructs an n x m matrix
void matrixArrayOfArrays(int n, int m)
{
    // allocate matrix with `n` cols
    float **matrix = calloc(n, sizeof(float *));

    // iterator vars
    int i, j;

    for (i = 0; i < n; ++i)
    {
        // allocate `m` cols for each row
        matrix[i] = calloc(m, sizeof(float));

        for (j = 0; j < m; ++j)
        {
            // populate each cell
            matrix[i][j] = get_matrix_position(m, i, j) + 1;

            // print it
            printf("%f", matrix[i][j]);

            // print a tab between each one
            if (j != m - 1)
            {
                printf("\t");
            }
        }

        // newline between rows
        printf("\n");
    }

    printf("\n");

    // iterate matrix col-major
    for (j = 0; j < m; ++j)
    {
        for (i = 0; i < n; ++i)
        {
            printf("%f", matrix[i][j]);
            if (i != n - 1)
            {
                printf("\t");
            }
        }

        printf("\n");
    }

    // free each row
    for (i = 0; i < n; ++i)
    {
        free(matrix[i]);
    }

    // free the matrix
    free(matrix);
}

// constructs an n x m matrix
void matrixOneBigArray(int n, int m)
{
    float *matrix = calloc(n * m, sizeof(float));

    // iterator vars
    int i, j;

    for (i = 0; i < n; ++i)
    {
        for (j = 0; j < m; ++j)
        {
            int position = get_matrix_position(m, i, j);
            // populate each cell
            matrix[position] = position + 1;

            // print it
            printf("%f", matrix[position]);

            // print a tab between each one
            if (j != m - 1)
            {
                printf("\t");
            }
        }

        // newline between rows
        printf("\n");
    }

    printf("\n");

    // iterate matrix col-major
    for (j = 0; j < m; ++j)
    {
        for (i = 0; i < n; ++i)
        {
            printf("%f", matrix[get_matrix_position(m, i, j)]);
            if (i != n - 1)
            {
                printf("\t");
            }
        }

        printf("\n");
    }

    free(matrix);
}