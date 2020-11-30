package com.company;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

public class RelaksacjaGlob extends Thread {

    /////////////////////////////////// Dane techniczne ///////////////////////////////////

    public RelaksacjaGlob(double o) {
        omega = o;
    }

    private final double omega;
    public static double eps = 1.0;
    public static double delta = 0.1;
    public static int nx = 150;
    public static int ny = 100;
    public static double V1 = 10.0;
    public static double V2 = 0.0;
    public static double xMax = delta * nx;
    public static double yMax = delta * ny;
    public static double sigmaX = 0.1 * xMax;
    public static double sigmaY = 0.1 * yMax;
    public static double TOL = 1e-8;

    public static double ro(double x, double y) {
        double ro1 = Math.exp(-Math.pow((x - 0.35 * xMax) / sigmaX, 2)
                - Math.pow((y - 0.5 * yMax) / sigmaY, 2));
        double ro2 = -Math.exp(-Math.pow((x - 0.65 * xMax) / sigmaX, 2)
                - Math.pow((y - 0.5 * yMax) / sigmaY, 2));
        return ro1 + ro2;
    }

    public static double countStop(ArrayList<ArrayList<Double>> Vn) {
        double stop = 0.0;
        for (int i = 0; i < nx; i++)
            for (int j = 0; j < ny; j++) {
                stop += Math.pow(delta, 2)
                        * (0.5 * Math.pow((Vn.get(i + 1).get(j) - Vn.get(i).get(j)) / delta, 2)
                        + 0.5 * Math.pow((Vn.get(i).get(j + 1) - Vn.get(i).get(j)) / delta, 2)
                        - ro(i, j) * Vn.get(i).get(j));
            }
        return stop;
    }

    public static double countErr(double Vip1_j, double Vi_j, double Vim1_j, double Vi_jp1, double Vi_jm1, double gestosc) {
        return ((Vip1_j - 2.0 * Vi_j + Vim1_j) / Math.pow(delta, 2)
                + (Vi_jp1 - 2.0 * Vi_j + Vi_jm1) / Math.pow(delta, 2)) + gestosc / eps;
    }

    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////// GLOBALNA ////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////

    public void relGlob() throws IOException {
        ArrayList<ArrayList<Double>> gestosc = new ArrayList<>(nx + 1);
        ArrayList<ArrayList<Double>> Vs = new ArrayList<>(nx + 1);
        ArrayList<ArrayList<Double>> Vn = new ArrayList<>(nx + 1);
        ArrayList<ArrayList<Double>> err = new ArrayList<>(nx + 1);
        ArrayList<Double> S = new ArrayList<>();
        int index;
        FileWriter fileDat = new FileWriter("globalnaDat_" + omega + ".dat", false);
        FileWriter fileErr = new FileWriter("globalnaErr_" + omega + ".dat", false);


        for (int i = 0; i <= nx; i++) {
            gestosc.add(new ArrayList<>(Collections.nCopies(ny + 1, 0.0)));
            Vs.add(new ArrayList<>(Collections.nCopies(ny + 1, 0.0)));
            Vn.add(new ArrayList<>(Collections.nCopies(ny + 1, 0.0)));
            err.add(new ArrayList<>(Collections.nCopies(ny + 1, 0.0)));

            for (int j = 0; j <= ny; j++)
                gestosc.get(i).set(j, ro(delta * i, delta * j));
        }

        for (int i = 0; i <= nx; i++) {
            Vs.get(i).set(0, V1);
            Vn.get(i).set(0, V1);
            Vs.get(i).set(ny, V2);
            Vn.get(i).set(ny, V2);
        }

        S.add(0.0);
        index = 0;

        do {
            for (int i = 1; i < nx; i++)
                for (int j = 1; j < ny; j++)
                    Vn.get(i).set(j, 0.25 * (Vs.get(i + 1).get(j) + Vs.get(i - 1).get(j) + Vs.get(i).get(j + 1)
                            + Vs.get(i).get(j - 1) + (Math.pow(delta, 2) / eps) * gestosc.get(i).get(j)));

            for (int j = 1; j < ny; j++) {
                Vn.get(0).set(j, Vn.get(1).get(j));
                Vn.get(nx).set(j, Vn.get(nx - 1).get(j));
            }

            for (int i = 0; i <= nx; i++)
                for (int j = 0; j <= ny; j++) {
                    Vs.get(i).set(j, (1.0 - omega) * Vs.get(i).get(j) + omega * Vn.get(i).get(j));
                }

            S.add(countStop(Vs));

            System.out.println(omega + " " + index + " Program dziala...");
            fileDat.write(index + " " + S.get(index + 1) + "\n");

            index++;
        } while (!(Math.abs((S.get(index) - S.get(index - 1)) / S.get(index)) < TOL));

        for (int j = 1; j < ny; j++) {
            for (int i = 1; i < nx; i++) {
                err.get(i).set(j, countErr(Vn.get(i + 1).get(j), Vn.get(i).get(j), Vn.get(i - 1).get(j),
                        Vn.get(i).get(j + 1), Vn.get(i).get(j - 1), gestosc.get(i).get(j)));
                fileErr.write(err.get(i).get(j) + " ");
            }
            fileErr.write("\n");
        }

        gestosc.clear();
        Vn.clear();
        Vs.clear();
        err.clear();

        fileDat.close();
        fileErr.close();
    }

    public void run() {
        try {
            relGlob();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
