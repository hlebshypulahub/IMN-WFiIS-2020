set(0,'DefaultAxesFontSize',15,'DefaultAxesFontName','Arial Cyr');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EULER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = readtable('Euler.dat');

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data.Var1(1:501), data.Var3(1:501), 'k', 'LineWidth', 5);
hold on;
plot(data.Var1(1:501), data.Var2(1:501), 'm--', 'LineWidth', 5);
hold on;
plot(data.Var1(502:552), data.Var2(502:552), 'r--', 'LineWidth', 5);
hold on;
plot(data.Var1(553:558), data.Var2(553:558), 'gs','LineWidth',4,'MarkerSize',16,'MarkerEdgeColor','b','MarkerFaceColor','g');
legend({'$analityczne$', '$\Delta t = 0.01$', '$\Delta t = 0.1$', '$\Delta t = 1.0$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Trzy rozwiązania numeryczne i rozwiązanie analityczne - metoda jawna Eulera','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('Wartośći','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data.Var1(1:501), data.Var4(1:501), 'b', 'LineWidth', 5);
hold on;
plot(data.Var1(502:552), data.Var4(502:552), 'r', 'LineWidth', 5);
hold on;
plot(data.Var1(553:558), data.Var4(553:558), 'k', 'LineWidth', 5);
legend({'$\Delta t = 0.01$', '$\Delta t = 0.1$', '$\Delta t = 1.0$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Błąd obliczeniowy dla trzech rozwiązań numerycznych - metoda jawna Eulera','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('Błąd','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
set(gca, 'YScale', 'log');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RK2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% data = readtable('rk2.dat');
% 
% figure;
% set(gcf, 'Position', get(0, 'Screensize'));
% plot(data.Var1(1:501), data.Var3(1:501), 'k', 'LineWidth', 12);
% hold on;
% plot(data.Var1(1:501), data.Var2(1:501), 'y', 'LineWidth', 7);
% hold on;
% plot(data.Var1(502:552), data.Var2(502:552), 'r-.', 'LineWidth', 4);
% hold on;
% plot(data.Var1(553:558), data.Var2(553:558), 'gs','LineWidth',4,'MarkerSize',16,'MarkerEdgeColor','b','MarkerFaceColor','g');
% legend({'$analityczne$', '$\Delta t = 0.01$', '$\Delta t = 0.1$', '$\Delta t = 1.0$'},...
%     'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
% title('Trzy rozwiązania numeryczne i rozwiązanie analityczne - metoda jawna RK2 (trapezów)','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
% ylabel('Wartośći','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
% 
% figure;
% set(gcf, 'Position', get(0, 'Screensize'));
% plot(data.Var1(1:501), data.Var4(1:501), 'b', 'LineWidth', 5);
% hold on;
% plot(data.Var1(502:552), data.Var4(502:552), 'r', 'LineWidth', 5);
% hold on;
% plot(data.Var1(553:558), data.Var4(553:558), 'k', 'LineWidth', 5);
% legend({'$\Delta t = 0.01$', '$\Delta t = 0.1$', '$\Delta t = 1.0$'},...
%     'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
% title('Błąd obliczeniowy dla trzech rozwiązań numerycznych - metoda jawna RK2 (trapezów)','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
% ylabel('Błąd','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
% set(gca, 'YScale', 'log');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RK4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% data = readtable('rk4.dat');
% 
% figure;
% set(gcf, 'Position', get(0, 'Screensize'));
% plot(data.Var1(1:501), data.Var3(1:501), 'k', 'LineWidth', 12);
% hold on;
% plot(data.Var1(1:501), data.Var2(1:501), 'y', 'LineWidth', 7);
% hold on;
% plot(data.Var1(502:552), data.Var2(502:552), 'r-.', 'LineWidth', 4);
% hold on;
% plot(data.Var1(553:558), data.Var2(553:558),  'gs','LineWidth',4,'MarkerSize',16,'MarkerEdgeColor','b','MarkerFaceColor','g');
% legend({'$analityczne$', '$\Delta t = 0.01$', '$\Delta t = 0.1$', '$\Delta t = 1.0$'},...
%     'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
% title('Trzy rozwiązania numeryczne i rozwiązanie analityczne - metoda jawna RK4','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
% ylabel('Wartośći','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
% 
% figure;
% set(gcf, 'Position', get(0, 'Screensize'));
% plot(data.Var1(1:501), data.Var4(1:501), 'b', 'LineWidth', 5);
% hold on;
% plot(data.Var1(502:552), data.Var4(502:552), 'r', 'LineWidth', 5);
% hold on;
% plot(data.Var1(553:558), data.Var4(553:558), 'k', 'LineWidth', 5);
% legend({'$\Delta t = 0.01$', '$\Delta t = 0.1$', '$\Delta t = 1.0$'},...
%     'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
% title('Błąd obliczeniowy dla trzech rozwiązań numerycznych - metoda jawna RK4','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
% ylabel('Błąd','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
% set(gca, 'YScale', 'log');





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RLC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %Q(t)
% data = readtable('rlc.dat');
% figure;
% set(gcf, 'Position', get(0, 'Screensize'));
% plot(data.Var1(1:2514), data.Var2(1:2514), 'r--', 'LineWidth', 3);
% hold on;
% plot(data.Var1(2515:5028), data.Var2(2515:5028), 'b', 'LineWidth', 3);
% hold on;
% plot(data.Var1(5029:7542), data.Var2(5029:7542), 'k--', 'LineWidth', 3);
% hold on;
% plot(data.Var1(7543:10056), data.Var2(7543:10056), 'm', 'LineWidth', 3);
% hold on;
% legend({'$\omega_{V} = 0.5\omega_{0}$', '$\omega_{V} = 0.8\omega_{0}$', '$\omega_{V} = \omega_{0}$', '$\omega_{V} = 1.2\omega_{0}$'},...
%     'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
% title('$Obwod\;\;RLC\;\;-\;\;Q(t)$','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex');
% xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
% ylabel('Q(t)','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
% xlim([0 0.25]);

% %I(t)
% data = readtable('rlc.dat');
% figure;
% set(gcf, 'Position', get(0, 'Screensize'));
% plot(data.Var1(1:2514), data.Var3(1:2514), 'r--', 'LineWidth', 3);
% hold on;
% plot(data.Var1(2515:5028), data.Var3(2515:5028), 'b', 'LineWidth', 3);
% hold on;
% plot(data.Var1(5029:7542), data.Var3(5029:7542), 'k--', 'LineWidth', 3);
% hold on;
% plot(data.Var1(7543:10056), data.Var3(7543:10056), 'm', 'LineWidth', 3);
% hold on;
% legend({'$\omega_{V} = 0.5\omega_{0}$', '$\omega_{V} = 0.8\omega_{0}$', '$\omega_{V} = \omega_{0}$', '$\omega_{V} = 1.2\omega_{0}$'},...
%     'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
% title('$Obwod\;\;RLC\;\;-\;\;I(t)$','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex');
% xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
% ylabel('I(t)','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
% xlim([0 0.25]);



































