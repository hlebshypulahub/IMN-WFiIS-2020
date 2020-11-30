package com.company;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws IOException {

        Picard();
        Newton();
        rk2();

    }

    ////////////////////////////////////////////////////////////////////////////
    /////////////////////////////                  /////////////////////////////
    ///////////////////////////// Punkt 1 - Picard /////////////////////////////
    /////////////////////////////                  /////////////////////////////
    ////////////////////////////////////////////////////////////////////////////

    public static void Picard() throws IOException {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double beta = 0.001;
        int N = 500;
        double gamma = 0.1;
        double tMax = 100;
        double dt = 0.1;
        double TOL = 1e-6;
        double MU = 20;
        double u_curr_mu;
        double u_prev_mu;
        double curr_mu;
        int n = (int) (tMax / dt);
        double alpha = (beta * N) - gamma;
        ArrayList<Double> u = new ArrayList<>();
        FileWriter file = new FileWriter("Picard.dat", false);

        /////////////////////////////// Generowanie ///////////////////////////////

        u.add(1.0);
        file.write(0 + " " + 1 + " " + (N - 1) + "\n");

        for (int i = 1; i <= n; i++) {
            curr_mu = 0;
            u_prev_mu = u.get(i - 1);

            while (true) {
                u_curr_mu = u.get(i - 1) + (dt / 2.0) * (alpha * u.get(i - 1) - beta * Math.pow(u.get(i - 1), 2) +
                        (alpha * u_prev_mu - beta * Math.pow(u_prev_mu, 2)));

                if (Math.abs(u_curr_mu - u_prev_mu) < TOL || curr_mu > MU) break;
                if (curr_mu != 0) u_prev_mu = u_curr_mu;

                curr_mu++;
            }

            u.add(u_curr_mu);
            file.write(i * dt + " " + u.get(i) + " " + (N - u.get(i)) + "\n");
        }

        file.close();
    }

    ////////////////////////////////////////////////////////////////////////////
    /////////////////////////////                  /////////////////////////////
    ///////////////////////////// Punkt 2 - Newton /////////////////////////////
    /////////////////////////////                  /////////////////////////////
    ////////////////////////////////////////////////////////////////////////////

    public static void Newton() throws IOException {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double beta = 0.001;
        int N = 500;
        double gamma = 0.1;
        double tMax = 100;
        double dt = 0.1;
        double TOL = 1e-6;
        double MU = 20;
        double u_curr_mu;
        double u_prev_mu;
        double curr_mu;
        int n = (int) (tMax / dt);
        double alpha = (beta * N) - gamma;
        ArrayList<Double> u = new ArrayList<>();
        FileWriter file = new FileWriter("Newton.dat", false);

        /////////////////////////////// Generowanie ///////////////////////////////

        u.add(1.0);
        file.write(0 + " " + 1 + " " + (N - 1) + "\n");

        for (int i = 1; i <= n; i++) {
            curr_mu = 0;
            u_prev_mu = u.get(i - 1);

            while (true) {
                u_curr_mu = u_prev_mu - (u_prev_mu - u.get(i - 1) - (dt / 2.0) * (alpha * u.get(i - 1) - beta * Math.pow(u.get(i - 1), 2) +
                        (alpha * u_prev_mu - beta * Math.pow(u_prev_mu, 2))));

                if (Math.abs(u_curr_mu - u_prev_mu) < TOL || curr_mu > MU) break;
                if (curr_mu != 0) u_prev_mu = u_curr_mu;

                curr_mu++;
            }

            u.add(u_curr_mu);
            file.write(i * dt + " " + u.get(i) + " " + (N - u.get(i)) + "\n");
        }

        file.close();
    }

    ////////////////////////////////////////////////////////////////////////////
    /////////////////////////////                  /////////////////////////////
    ///////////////////////////// Punkt 3 - RK2Njw /////////////////////////////
    /////////////////////////////                  /////////////////////////////
    ////////////////////////////////////////////////////////////////////////////

    public static void rk2() throws IOException {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double beta = 0.001;
        int N = 500;
        double gamma = 0.1;
        double tMax = 100;
        double dt = 0.1;
        double TOL = 1e-6;
        double mu = 20;
        double mu0 = 1;
        double U1_mu = mu0;
        double curr_U1;
        double U2_mu = mu0;
        double curr_U2;
        int n = (int) (tMax / dt);
        double alpha = (beta * N) - gamma;
        ArrayList<Double> u = new ArrayList<>();
        double tmp;
        double F1;
        double F2;
        double dU1;
        double dU2;
        double res;
        FileWriter file = new FileWriter("rk2.dat", false);

        double[][] a = new double[][]{{0.25, 0.25 - Math.sqrt(3) / 6}, {0.25 + Math.sqrt(3) / 6, 0.25}};
        double[] b = {0.5, 0.5};
        double[][] m = {{0, 0}, {0, 0}};

        /////////////////////////////// Generowanie ///////////////////////////////

        u.add(1.0);

        for (int i = 1; i <= n; i++) {
            tmp = alpha * mu0 - beta * Math.pow(mu0, 2);
            F1 = mu0 - u.get(i - 1) - (dt * (a[0][0] * tmp + a[0][1] * tmp));
            F2 = mu0 - u.get(i - 1) - (dt * (a[1][0] * tmp + a[1][1] * tmp));

            m[0][0] = 1 - dt * a[0][0] * (alpha - 2.0 * beta * mu0);
            m[0][1] = -dt * a[0][1] * (alpha - 2.0 * beta * mu0);
            m[1][0] = -dt * a[1][0] * (alpha - 2.0 * beta * mu0);
            m[1][1] = 1 - dt * a[1][1] * (alpha - 2.0 * beta * mu0);

            while (true) {
                dU1 = ((F2 * m[0][1]) - (F1 * m[1][1])) / (m[0][0] * m[1][1]) - (m[0][1] * m[1][0]);
                dU2 = ((F1 * m[1][0]) - (F2 * m[0][0])) / (m[0][0] * m[1][1]) - (m[0][1] * m[1][0]);
                curr_U1 = U1_mu + dU1;
                curr_U2 = U2_mu + dU2;
                if ((Math.abs(curr_U1 - U1_mu) <= TOL && Math.abs(curr_U2 - U2_mu) <= TOL) || --mu < 0) break;
                U1_mu = curr_U1;
                U2_mu = curr_U2;
            }

            res = u.get(i - 1) + dt * (b[0] * (curr_U1 * (beta * N - gamma) - beta * Math.pow(curr_U1, 2))
                    + b[1] * (curr_U2 * (beta * N - gamma) - beta * Math.pow(curr_U2, 2)));
            u.add(res);
            file.write(i * dt + " " + u.get(i) + " " + (N - u.get(i)) + "\n");
        }

        file.close();
    }
}
