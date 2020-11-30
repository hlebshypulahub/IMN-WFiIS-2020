package com.company;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws IOException {

        Euler();
        rk2();
        rk4();
        rlc();

    }

    ///////////////////////////// Rozwiazanie dokladne /////////////////////////////

    public static double exactSol(double t, double lambda) {
        return Math.exp(lambda * t);
    }

    ///////////////////////////////////////////////////////////////////////////
    /////////////////////////////                 /////////////////////////////
    ///////////////////////////// Punkt 1 - Euler /////////////////////////////
    /////////////////////////////                 /////////////////////////////
    ///////////////////////////////////////////////////////////////////////////

    public static void Euler() throws IOException {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double lambda = -1.;
        double t_min = 0.;
        double t_max = 5.;
        ArrayList<Double> dt = new ArrayList<>();
        dt.add(0.01);
        dt.add(0.1);
        dt.add(1.);
        ArrayList<Double> y = new ArrayList<>();
        int n;
        FileWriter file = new FileWriter("Euler.dat", false);

        ///////////////////////////// Generowanie /////////////////////////////

        for (Double step : dt) {

            y.add(1.);

            n = (int) ((t_max - t_min) / step);

            double result;
            double t;
            double dif;

            for (int i = 0; i <= n; i++) {
                t = i * step;
                result = y.get(i) + step * lambda * y.get(i);
//                System.out.println(y.get(i) + " " + step + " " + result + " " + t);
                y.add(result);
                dif = Math.abs(y.get(i) - exactSol(lambda, t));

                file.write(t + "\t" + y.get(i) + "\t"
                        + exactSol(t, lambda) + "\t" + dif + "\n");
            }

            y.clear();
            file.write("\n\n\n");
        }

        file.close();
    }

    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////               /////////////////////////////
    ///////////////////////////// Punkt 2 - RK2 /////////////////////////////
    /////////////////////////////               /////////////////////////////
    /////////////////////////////////////////////////////////////////////////

    public static void rk2() throws IOException {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double lambda = -1.;
        double t_min = 0.;
        double t_max = 5.;
        ArrayList<Double> dt = new ArrayList<>();
        dt.add(0.01);
        dt.add(0.1);
        dt.add(1.);
        ArrayList<Double> y = new ArrayList<>();
        int n;
        FileWriter file = new FileWriter("rk2.dat", false);

        ///////////////////////////// Generowanie /////////////////////////////

        for (Double step : dt) {

            y.add(1.);

            n = (int) ((t_max - t_min) / step);

            double k1;
            double k2;
            double t;
            double result;
            double dif;

            for (int i = 0; i <= n; i++) {
                k1 = lambda * y.get(i);
                k2 = lambda * (y.get(i) + step * k1);
                t = i * step;
                result = y.get(i) + (step / 2.0) * (k1 + k2);
//                System.out.println(y.get(i) + " " + step + " " + result + " " + t);
                y.add(result);
                dif = Math.abs(y.get(i) - exactSol(lambda, t));

                file.write(t + "\t" + y.get(i) + "\t"
                        + exactSol(t, lambda) + "\t" + dif + "\n");
            }

            y.clear();
            file.write("\n\n\n");
        }

        file.close();
    }

    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////               /////////////////////////////
    ///////////////////////////// Punkt 3 - RK4 /////////////////////////////
    /////////////////////////////               /////////////////////////////
    /////////////////////////////////////////////////////////////////////////

    public static void rk4() throws IOException {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double lambda = -1.;
        double t_min = 0.;
        double t_max = 5.;
        ArrayList<Double> dt = new ArrayList<>();
        dt.add(0.01);
        dt.add(0.1);
        dt.add(1.);
        ArrayList<Double> y = new ArrayList<>();
        int n;
        FileWriter file = new FileWriter("rk4.dat", false);

        ///////////////////////////// Generowanie /////////////////////////////

        for (Double step : dt) {

            y.add(1.);

            n = (int) ((t_max - t_min) / step);

            double k1;
            double k2;
            double k3;
            double k4;
            double t;
            double result;
            double dif;

            for (int i = 0; i <= n; i++) {
                k1 = lambda * y.get(i);
                k2 = lambda * (y.get(i) + (step / 2.0) * k1);
                k3 = lambda * (y.get(i) + (step / 2.0) * k2);
                k4 = lambda * (y.get(i) + step * k3);
                t = i * step;
                result = y.get(i) + (step / 6.0) * (k1 + 2.0 * k2 + 2.0 * k3 + k4);
//                System.out.println(y.get(i) + " " + step + " " + result + " " + t);
                y.add(result);
                dif = Math.abs(y.get(i) - exactSol(lambda, t));

                file.write(t + "\t" + y.get(i) + "\t"
                        + exactSol(t, lambda) + "\t" + dif + "\n");
            }

            y.clear();
            file.write("\n\n\n");
        }

        file.close();
    }

    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////               /////////////////////////////
    ///////////////////////////// Punkt 4 - RLC /////////////////////////////
    /////////////////////////////               /////////////////////////////
    /////////////////////////////////////////////////////////////////////////

    public static void rlc() throws IOException {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double dt = 1e-4;
        double R = 100.0;
        double L = 0.1;
        double C = 0.001;
        double w0 = 1.0 / Math.sqrt(L * C);
        double T0 = 2 * Math.PI / w0;
        double t_min = 0.0;
        double t_max = 4 * T0;
        ArrayList<Double> wV = new ArrayList<>();
        wV.add(0.5 * w0);
        wV.add(0.8 * w0);
        wV.add(1.0 * w0);
        wV.add(1.2 * w0);
        ArrayList<Double> iLi = new ArrayList<>();
        ArrayList<Double> qLi = new ArrayList<>();
        int n;
        FileWriter file = new FileWriter("rlc.dat", false);

        ///////////////////////////// Generowanie /////////////////////////////

        for (Double w : wV) {

            iLi.add(0.0);
            qLi.add(0.0);

            n = (int) ((t_max - t_min) / dt);

            double t, tHalf, tNext;
            double v, vHalf, vNext;
            double I, Q;
            double k1I, k2I, k3I, k4I, k1Q, k2Q, k3Q, k4Q;



            for (int i = 0; i <= n; i++) {
                t = i * dt;
                tHalf = (i + 0.5) * dt;
                tNext = (i + 1.0) * dt;
                v = 10.0 * Math.sin(t * w);
                vHalf = 10.0 * Math.sin(tHalf * w);
                vNext = 10.0 * Math.sin(tNext * w);
                I = iLi.get(i);
                Q = qLi.get(i);

                k1Q = I;
                k1I = (v / L) - ((1.0 / (L * C)) * Q) - ((R / L) * I);
                k2Q = I + ((dt / 2.0) * k1I);
                k2I = (vHalf / L) - (1.0 / (L * C)) * (Q + (dt / 2.0) * k1Q) - (R / L) * (I + (dt / 2.0) * k1I);
                k3Q = I + (dt / 2.0) * k2I;
                k3I = (vHalf / L) - (1.0 / (L * C)) * (Q + (dt / 2.0) * k2Q) - (R / L) * (I + (dt / 2.0) * k2I);
                k4Q = I + (dt * k3I);
                k4I = vNext / L - (1 / (L * C) * (Q + dt * k3Q)) - (R / L) * (I + (dt * k3I));


                qLi.add(Q + (dt / 6.0) * (k1Q + k2Q + k3Q + k4Q));
                iLi.add(I + (dt / 6.0) * (k1I + k2I + k3I + k4I));

                file.write(t + "\t" + Q + "\t" + I + "\n");
            }

            qLi.clear();
            iLi.clear();
            file.write("\n\n\n\n\n");
        }

        file.close();
    }

}
