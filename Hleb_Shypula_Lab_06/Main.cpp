#include "mgmres.h"
#include "mgmres.c"

#include <stdio.h>
#include <vector>
#include <math.h>
#include <fstream>
#include <iostream>

using namespace std;

double ro(double x, double y, double xMax, double yMax, double sigma)
{
    double ro1 = -exp(-pow((x - 0.75 * xMax) / (sigma), 2) -
                      pow((y - 0.5 * yMax) / (sigma), 2));
    double ro2 = exp(-pow((x - 0.25 * xMax) / (sigma), 2) -
                     pow((y - 0.5 * yMax) / (sigma), 2));
    return ro1 + ro2;
}

void poisson(double delta, int nx, int ny, double eps1, double eps2,
             double V1, double V2, double V3, double V4,
             bool isGestosc)
{
    int N = (nx + 1) * (ny + 1);
    vector<double> a = vector<double>(5 * N);
    vector<int> ja = vector<int>(5 * N);
    vector<int> ia = vector<int>(N + 1);
    for (auto e : ia)
        e = -1;
    vector<double> b = vector<double>(N);
    vector<double> V = vector<double>(N);
    int i;
    int j;
    vector<double> epsL = vector<double>(N + nx + 1);

    fstream fA;
    fstream fAk;
    fstream fB;
    fstream fV;

    fA.open("A_" + to_string(isGestosc) +
                "_eps1_" + to_string(eps1) + "_eps2_" + to_string(eps2) +
                "_nx_" + to_string(nx) + "_ny_" + to_string(ny) + ".dat",
            ios::out);

    fAk.open("Ak_" + to_string(isGestosc) +
                "_eps1_" + to_string(eps1) + "_eps2_" + to_string(eps2) +
                "_nx_" + to_string(nx) + "_ny_" + to_string(ny) + ".dat",
            ios::out);

    fB.open("b_" + to_string(isGestosc) +
                "_eps1_" + to_string(eps1) + "_eps2_" + to_string(eps2) +
                "_nx_" + to_string(nx) + "_ny_" + to_string(ny) + ".dat",
            ios::out);

    fV.open("V_" + to_string(isGestosc) +
                "_eps1_" + to_string(eps1) + "_eps2_" + to_string(eps2) +
                "_nx_" + to_string(nx) + "_ny_" + to_string(ny) + ".dat",
            ios::out);

    for (int l = 0; l < N + nx + 1; l++)
    {
        j = floor((double)(l) / (nx + 1));
        i = l - j * (nx + 1);
        if (i <= nx / 2)
            epsL[l] = eps1;
        else
            epsL[l] = eps2;
    }

    int k = -1;
    int nz_num;

    for (int l = 0; l < N; l++)
    {
        int brzeg = 0;
        double vb = 0;

        j = floor((double)(l) / (nx + 1));
        i = l - j * (nx + 1);

        if (i == 0)
        {
            brzeg = 1;
            vb = V1;
        }
        if (j == ny)
        {
            brzeg = 1;
            vb = V2;
        }
        if (i == nx)
        {
            brzeg = 1;
            vb = V3;
        }
        if (j == 0)
        {
            brzeg = 1;
            vb = V4;
        }

        if (!isGestosc)
            b[l] = -ro(i * delta, j * delta, delta * nx,
                       delta * ny, delta * nx / 10.0);
        else
            b[l] = 0.0;

        if (brzeg == 1)
            b[l] = vb;

        ia[l] = -1;

        if ((l - nx - 1) >= 0 && brzeg == 0)
        {
            k++;
            if (ia[l] < 0)
                ia[l] = k;
            a[k] = epsL[l] / pow(delta, 2);
            ja[k] = l - nx - 1;
        }

        if ((l - 1) >= 0 && brzeg == 0)
        {
            k++;
            if (ia[l] < 0)
                ia[l] = k;
            a[k] = epsL[l] / pow(delta, 2);
            ja[k] = l - 1;
        }

        k++;
        if (ia[l] < 0)
            ia[l] = k;
        if (brzeg == 0)
            a[k] = -(2 * epsL[l] + epsL[l + 1] +
                     epsL[l + nx + 1]) /
                   pow(delta, 2);
        else
            a[k] = 1;
        ja[k] = l;

        if (l < N && brzeg == 0)
        {
            k++;
            a[k] = epsL[l + 1] / pow(delta, 2);
            ja[k] = l + 1;
        }

        if (l < (N - nx - 1) && brzeg == 0)
        {
            k++;
            a[k] = epsL[l + nx + 1] / pow(delta, 2);
            ja[k] = l + nx + 1;
        }

        fA << l << " " << i << " " << j << " " << a[l] << "\n";
        fAk << k << " " << a[k] << "\n";
        fB << l << " " << i << " " << j << " " << b[l] << "\n";
    }

    cout << eps1 << " " << eps2 << " " << k << endl;

    nz_num = k + 1;
    ia[N] = nz_num;

    fA.close();
    fB.close();

    pmgmres_ilu_cr(N, nz_num, &ia[0], &ja[0], &a[0], &V[0], &b[0], 500, 500, 1e-8, 1e-8);

    for (int l = 0; l < N; l++)
    {
        fV << V[l] << " ";
        if ((l + 1) % (nx + 1) == 0)
            fV << endl;
    }

    fV.close();
}

int main()
{
    poisson(0.1, 4, 4, 1, 1, 10, -10, 10, -10, true);
    poisson(0.1, 50, 50, 1, 1, 10, -10, 10, -10, true);
    poisson(0.1, 100, 100, 1, 1, 10, -10, 10, -10, true);
    poisson(0.1, 200, 200, 1, 1, 10, -10, 10, -10, true);
    poisson(0.1, 100, 100, 1, 1, 0, 0, 0, 0, false);
    poisson(0.1, 100, 100, 1, 2, 0, 0, 0, 0, false);
    poisson(0.1, 100, 100, 1, 10, 0, 0, 0, 0, false);

    return 0;
}