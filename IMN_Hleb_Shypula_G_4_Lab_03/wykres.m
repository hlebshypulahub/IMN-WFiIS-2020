%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRAPEZ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = readtable('trapez.dat');

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data.Var1(1:176), data.Var3(1:176), 'r', 'LineWidth', 5);
hold on;
plot(data.Var1(177:1692), data.Var3(177:1692), 'b', 'LineWidth', 5);
legend({'$TOL = 10^{-2}$', '$TOL = 10^{-5}$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda Trapezow : x(t)','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('x(t)','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
xlim([0, 40]);

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data.Var1(1:176), data.Var4(1:176), 'r', 'LineWidth', 5);
hold on;
plot(data.Var1(177:1692), data.Var4(177:1692), 'b', 'LineWidth', 5);
legend({'$TOL = 10^{-2}$', '$TOL = 10^{-5}$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda Trapezow : v(t)','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('v(t)','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
xlim([0, 40]);

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data.Var1(1:176), data.Var2(1:176), 'r', 'LineWidth', 5);
hold on;
plot(data.Var1(177:1692), data.Var2(177:1692), 'b', 'LineWidth', 5);
legend({'$TOL = 10^{-2}$', '$TOL = 10^{-5}$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda Trapezow : dt(t)','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('dt(t)','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
xlim([0, 40]);

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data.Var3(1:176), data.Var4(1:176), 'r', 'LineWidth', 5);
hold on;
plot(data.Var3(177:1692), data.Var4(177:1692), 'b', 'LineWidth', 5);
legend({'$TOL = 10^{-2}$', '$TOL = 10^{-5}$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda Trapezow : v(x)','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('x','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('v(x)','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RK2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = readtable('rk2.dat');

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data.Var1(1:212), data.Var3(1:212), 'r', 'LineWidth', 5);
hold on;
plot(data.Var1(213:1908), data.Var3(213:1908), 'b', 'LineWidth', 5);
legend({'$TOL = 10^{-2}$', '$TOL = 10^{-5}$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda RK2 : x(t)','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('x(t)','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
xlim([0, 40]);

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data.Var1(1:212), data.Var4(1:212), 'r', 'LineWidth', 5);
hold on;
plot(data.Var1(213:1908), data.Var4(213:1908), 'b', 'LineWidth', 5);
legend({'$TOL = 10^{-2}$', '$TOL = 10^{-5}$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda RK2 : v(t)','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('v(t)','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
xlim([0, 40]);

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data.Var1(1:212), data.Var2(1:212), 'r', 'LineWidth', 5);
hold on;
plot(data.Var1(213:1908), data.Var2(213:1908), 'b', 'LineWidth', 5);
legend({'$TOL = 10^{-2}$', '$TOL = 10^{-5}$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda RK2 : dt(t)','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('dt(t)','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')
xlim([0, 40]);

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data.Var3(1:212), data.Var4(1:212), 'r', 'LineWidth', 5);
hold on;
plot(data.Var3(213:1908), data.Var4(213:1908), 'b', 'LineWidth', 5);
legend({'$TOL = 10^{-2}$', '$TOL = 10^{-5}$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda RK2 : v(x)','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('x','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('v(x)','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')


























