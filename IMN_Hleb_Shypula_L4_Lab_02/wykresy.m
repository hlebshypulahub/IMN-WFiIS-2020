%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PICARD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = readtable('Picard.dat');

figure;
set(gcf, 'Position', get(0, 'Screensize'));

plot(data.Var1(1:1001), data.Var2(1:1001), 'r', 'LineWidth', 5);
hold on;
plot(data.Var1(1:1001), data.Var3(1:1001), 'b', 'LineWidth', 5);

legend({'$u(t)$', '$z(t)$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda Picarda','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('Wartośći','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NEWTON %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = readtable('Newton.dat');

figure;
set(gcf, 'Position', get(0, 'Screensize'));

plot(data.Var1(1:1001), data.Var2(1:1001), 'r', 'LineWidth', 5);
hold on;
plot(data.Var1(1:1001), data.Var3(1:1001), 'b', 'LineWidth', 5);

legend({'$u(t)$', '$z(t)$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda Newtona','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('Wartośći','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NEWTON %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = readtable('rk2.dat');

figure;
set(gcf, 'Position', get(0, 'Screensize'));

plot(data.Var1(1:1000), data.Var2(1:1000), 'r', 'LineWidth', 5);
hold on;
plot(data.Var1(1:1000), data.Var3(1:1000), 'b', 'LineWidth', 5);

legend({'$u(t)$', '$z(t)$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Metoda Niejawna RK2','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
xlabel('t','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold') 
ylabel('Wartośći','FontSize', 15, 'Color', 'k', 'FontWeight', 'bold')

























