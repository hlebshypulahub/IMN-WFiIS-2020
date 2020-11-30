set(0,'DefaultAxesFontSize',15,'DefaultAxesFontName','Arial Cyr');

figure;

subplot(2,3,1);

set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('potencjal_16.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:2:n);
yticks(0:2:m);
colormap(gca,'jet')
colorbar
title('$Mapa \;\; potencjalu \;:\; k = 16$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')

subplot(2,3,2);

set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('potencjal_8.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:2:n);
yticks(0:2:m);
colormap(gca,'jet')
colorbar
title('$Mapa \;\; potencjalu \;:\; k = 8$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')

subplot(2,3,3);

set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('potencjal_4.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:5:n);
yticks(0:5:m);
colormap(gca,'jet')
colorbar
title('$Mapa \;\; potencjalu \;:\; k = 4$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')

subplot(2,3,4);

set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('potencjal_2.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:10:n);
yticks(0:10:m);
colormap(gca,'jet')
colorbar
title('$Mapa \;\; potencjalu \;:\; k = 2$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')

subplot(2,3,5);

set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('potencjal_1.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:20:n);
yticks(0:20:m);
colormap(gca,'jet')
colorbar
title('$Mapa \;\; potencjalu \;:\; k = 1$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data16 = readtable('iteracje_16.dat');
data8 = readtable('iteracje_8.dat');
data4 = readtable('iteracje_4.dat');
data2 = readtable('iteracje_2.dat');
data1 = readtable('iteracje_1.dat');

subplot(2,3,6);

set(gcf, 'Position', get(0, 'Screensize'));
plot(data16.Var2, data16.Var3, 'r', 'LineWidth', 5);
hold on;
plot(data8.Var2, data8.Var3, 'b', 'LineWidth', 5);
hold on;
plot(data4.Var2, data4.Var3, 'g', 'LineWidth', 5);
hold on;
plot(data2.Var2, data2.Var3, 'm', 'LineWidth', 5);
hold on;
plot(data1.Var2, data1.Var3, 'k', 'LineWidth', 5);
grid on;
legend({'$k = 16$',...
    '$k = 8$',...
    '$k = 4$',...
    '$k = 2$',...
    '$k = 1$'},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('$Zmiana \;\; S^{(k)}(it) \;,\; (517 \;\; iteracji)$','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('iteracja','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('S','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')





