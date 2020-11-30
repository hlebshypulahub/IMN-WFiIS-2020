package com.company;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

public class Main {

    /////////////////////////////////// Dane techniczne ///////////////////////////////////

    public static double delta = 0.2;
    public static int nx = 128;
    public static int ny = nx;
    public static double xMax = delta * nx;
    public static double yMax = delta * ny;
    public static double TOL = 1e-8;

    public static double countStop(ArrayList<ArrayList<Double>> V, int k) {
        double stop = 0.0;
        for (int i = 0; i <= nx - k; i += k)
            for (int j = 0; j <= ny - k; j += k)
                stop += (Math.pow(k * delta, 2) / 2.0)
                        * (Math.pow((V.get(i + k).get(j) - V.get(i).get(j))
                        / (2 * k * delta) + (V.get(i + k).get(j + k) - V.get(i).get(j + k))
                        / (2 * k * delta), 2) + Math.pow((V.get(i).get(j + k) - V.get(i).get(j))
                        / (2 * k * delta) + (V.get(i + k).get(j + k) - V.get(i + k).get(j))
                        / (2 * k * delta), 2));
        return stop;
    }

    /////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////// RELAKSACJA ////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////

    public static void relaksacja() throws IOException {
        int it = 0;
        ArrayList<ArrayList<Double>> V = new ArrayList<>(nx + 1);
        for (int i = 0; i <= nx; i++)
            V.add(new ArrayList<>(Collections.nCopies(ny + 1, 0.0)));

        for (int i = 0; i <= nx; i++) {
            V.get(0).set(i, Math.sin(Math.PI * (delta * i / yMax)));
            V.get(i).set(0, Math.sin(2 * Math.PI * (delta * i / xMax)));
            V.get(i).set(ny, -Math.sin(2 * Math.PI * (delta * i / xMax)));
            V.get(nx).set(i, Math.sin(Math.PI * (delta * i / yMax)));
        }

        ArrayList<Integer> K = new ArrayList<>();
        K.add(16);
        K.add(8);
        K.add(4);
        K.add(2);
        K.add(1);

        for (Integer k : K) {
            ArrayList<Double> S = new ArrayList<>();
            int index;
            FileWriter fileP = new FileWriter("potencjal_" + k + ".dat", false);
            FileWriter fileI = new FileWriter("iteracje_" + k + ".dat", false);

            S.add(1.0);
            index = 0;

            do {
                index++;
                it++;

                for (int i = k; i <= nx - k; i += k)
                    for (int j = k; j <= ny - k; j++)
                        V.get(i).set(j, 0.25 * (V.get(i + k).get(j) + V.get(i - k).get(j)
                                + V.get(i).get(j + k) + V.get(i).get(j - k)));

                S.add(countStop(V, k));
                System.out.println(k + " " + index + " " + it + " " + S.get(index));
                fileI.write(index + " " + it + " " + S.get(index) + "\n");
            } while (!(Math.abs((S.get(index) - S.get(index - 1)) / S.get(index - 1)) < TOL));


            for (int j = 0; j <= ny; j += k) {
                for (int i = 0; i <= nx; i += k) {
                    fileP.write(V.get(i).get(j) + " ");
                }
                fileP.write("\n");
            }

            if (k != 1) {
                for (int i = 0; i <= nx - k; i += k) {
                    for (int j = 0; j <= ny - k; j += k) {
                        V.get(i + k / 2).set(j + k / 2, 0.25 * (V.get(i).get(j) + V.get(i + k).get(j) + V.get(i).get(j + k) + V.get(i + k).get(j + k)));
                        if (i < (nx - k))
                            V.get(i + k).set(j + k / 2, 0.5 * (V.get(i + k).get(j) + V.get(i + k).get(j + k)));
                        if (j < (ny - k))
                            V.get(i + k / 2).set(j + k, 0.5 * (V.get(i).get(j + k) + V.get(i + k).get(j + k)));
                        if (j > 0)
                            V.get(i + k / 2).set(j, 0.5 * (V.get(i).get(j) + V.get(i + k).get(j)));
                        if (i > 0)
                            V.get(i).set(j + k / 2, 0.5 * (V.get(i).get(j) + V.get(i).get(j + k)));
                    }
                }
            }

            fileI.close();
            fileP.close();
        }
    }

    public static void main(String[] args) throws IOException {

        relaksacja();

    }
}
