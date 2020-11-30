package com.company;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws IOException {
        timeTrapez(0.01, 0.0, 1.0, 0.75, 2, 40.0, 5.0);
        timeRK2(0.01, 0.0, 1.0, 0.75, 2, 40.0, 5.0);
    }

    ////////////////////////////////////////////////////////////////////////////
    /////////////////////////////                  /////////////////////////////
    ///////////////////////////// Punkt 1 - Trapez /////////////////////////////
    /////////////////////////////                  /////////////////////////////
    ////////////////////////////////////////////////////////////////////////////

    public static ArrayList<Double> trapez(double xn, double vn, double dt, double alpha) {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double delta = 10e-10;
        double x_next = xn;
        double v_next = vn;
        double a11 = 1.0;
        double a12 = -dt / 2.0;
        double a21;
        double a22;
        double F;
        double G;
        double dx;
        double dv;
        ArrayList<Double> result = new ArrayList<>();

        /////////////////////////////// Generowanie ///////////////////////////////

        do {
            F = x_next - xn - (dt / 2.0) * (vn + v_next);
            G = v_next - vn - (dt / 2.0) * ((alpha * (1.0 - Math.pow(xn, 2)) * vn - xn) + (alpha * (1.0 - Math.pow(x_next, 2)) * v_next - x_next));

            a21 = (-dt / 2.0) * (-2.0 * alpha * x_next * v_next - 1.0);
            a22 = 1.0 - (dt / 2.0) * alpha * (1.0 - Math.pow(x_next, 2.0));

            dx = ((-F) * a22 - (-G) * a12) / (a11 * a22 - a12 * a21);
            dv = (a11 * (-G) - a21 * (-F)) / (a11 * a22 - a12 * a21);

            x_next += dx;
            v_next += dv;
        } while (!(dx < delta) || !(dv < delta));

        result.add(x_next);
        result.add(v_next);
        return result;
    }

    /////////////////////////////// Kontrola kroku czasowego ///////////////////////////////

    public static void timeTrapez(double x0, double v0, double dt0, double S, int p, double tMax, double alpha) throws IOException {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double dt = dt0;
        double xn;
        double vn;
        double xErr;
        double vErr;
        double maxErr;
        double t;
        ArrayList<Double> TOL = new ArrayList<>();
        TOL.add(1e-2);
        TOL.add(1e-5);
        FileWriter file = new FileWriter("trapez.dat", false);

        /////////////////////////////// Generowanie ///////////////////////////////

        for (double tol : TOL) {
            xn = x0;
            vn = v0;
            t = 0.0;

            while (t <= tMax) {
                ArrayList<Double> step_n12 = trapez(xn, vn, dt, alpha);
                ArrayList<Double> step_n22 = trapez(step_n12.get(0), step_n12.get(1), dt, alpha);
                ArrayList<Double> step_n21 = trapez(xn, vn, 2.0 * dt, alpha);

                xErr = (step_n22.get(0) - step_n21.get(0)) / (Math.pow(2, p) - 1.0);
                vErr = (step_n22.get(1) - step_n21.get(1)) / (Math.pow(2, p) - 1.0);
                maxErr = Math.max(Math.abs(xErr), Math.abs(vErr));

                if (maxErr < tol) {
                    t += 2 * dt;
                    xn = step_n22.get(0);
                    vn = step_n22.get(1);
                    file.write(t + " " + dt + " " + xn + " " + vn + " \n");
//                    System.out.print(t + " " + dt + " " + xn + " " + vn + " \n");
                }

                dt *= Math.pow((S * tol) / maxErr, 1.0 / (p + 1.0));
            }

            file.write("\n\n\n\n\n");
        }

        file.close();
    }

    ////////////////////////////////////////////////////////////////////////////
    /////////////////////////////                  /////////////////////////////
    /////////////////////////////   Punkt 1 - RK2  /////////////////////////////
    /////////////////////////////                  /////////////////////////////
    ////////////////////////////////////////////////////////////////////////////

    public static ArrayList<Double> rk2(double xn, double vn, double dt, double alpha) {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double k1x;
        double k2x;
        double k1v;
        double k2v;
        double x_next;
        double v_next;
        ArrayList<Double> result = new ArrayList<>();

        /////////////////////////////// Generowanie ///////////////////////////////

        k1x = vn;
        k1v = alpha * (1.0 - Math.pow(xn, 2)) * vn - xn;
        k2x = vn + dt * k1v;
        k2v = alpha * (1.0 - Math.pow(xn + dt * k1x, 2)) * (vn + dt * k1v) - (xn + dt * k1x);

        x_next = xn + (dt / 2.0) * (k1x + k2x);
        v_next = vn + (dt / 2.0) * (k1v + k2v);

        result.add(x_next);
        result.add(v_next);
        return result;
    }

    /////////////////////////////// Kontrola kroku czasowego ///////////////////////////////

    public static void timeRK2(double x0, double v0, double dt0, double S, int p, double tMax, double alpha) throws IOException {

        ///////////////////////////// Dane techniczne /////////////////////////////

        double dt = dt0;
        double xn;
        double vn;
        double xErr;
        double vErr;
        double maxErr;
        double t;
        ArrayList<Double> TOL = new ArrayList<>();
        TOL.add(1e-2);
        TOL.add(1e-5);
        FileWriter file = new FileWriter("rk2.dat", false);

        /////////////////////////////// Generowanie ///////////////////////////////

        for (double tol : TOL) {
            xn = x0;
            vn = v0;
            t = 0.0;

            while (t <= tMax) {
                ArrayList<Double> step_n12 = rk2(xn, vn, dt, alpha);
                ArrayList<Double> step_n22 = rk2(step_n12.get(0), step_n12.get(1), dt, alpha);
                ArrayList<Double> step_n21 = rk2(xn, vn, 2.0 * dt, alpha);

                xErr = (step_n22.get(0) - step_n21.get(0)) / (Math.pow(2, p) - 1.0);
                vErr = (step_n22.get(1) - step_n21.get(1)) / (Math.pow(2, p) - 1.0);
                maxErr = Math.max(Math.abs(xErr), Math.abs(vErr));

                if (maxErr < tol) {
                    t += 2 * dt;
                    xn = step_n22.get(0);
                    vn = step_n22.get(1);
                    file.write(t + " " + dt + " " + xn + " " + vn + " \n");
//                    System.out.print(t + " " + dt + " " + xn + " " + vn + " \n");
                }

                dt *= Math.pow((S * tol) / maxErr, 1.0 / (p + 1.0));
            }

            file.write("\n\n\n\n\n");
        }

        file.close();
    }

}
