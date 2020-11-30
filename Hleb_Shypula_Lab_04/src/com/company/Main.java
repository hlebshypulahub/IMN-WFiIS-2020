package com.company;

public class Main {


    public static void main(String[] args) {

        RelaksacjaGlob rel1 = new RelaksacjaGlob(0.6);
        rel1.start();
        RelaksacjaGlob rel2 = new RelaksacjaGlob(1.0);
        rel2.start();
        /////////////////////////////////////////////////
        RelaksacjaLok rel3 = new RelaksacjaLok(1.0);
        rel3.start();
        RelaksacjaLok rel4 = new RelaksacjaLok(1.4);
        rel4.start();
        RelaksacjaLok rel5 = new RelaksacjaLok(1.8);
        rel5.start();
        RelaksacjaLok rel6 = new RelaksacjaLok(1.9);
        rel6.start();

    }
}
