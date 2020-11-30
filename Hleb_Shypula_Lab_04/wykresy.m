set(0,'DefaultAxesFontSize',15,'DefaultAxesFontName','Arial Cyr');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GLOBALNA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data06 = readtable('globalnaDat_0.6.dat');
data10 = readtable('globalnaDat_1.0.dat');

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data06.Var1, data06.Var2, 'r', 'LineWidth', 5);
hold on;
plot(data10.Var1, data10.Var2, 'b', 'LineWidth', 5);
grid on;
xlim([0 40e3]);
set(gca, 'XScale', 'log');
data06it = max(data06.Var1) + 1;
data10it = max(data10.Var1) + 1;
legend({sprintf('$\\;\\omega = 0.6\\;\\;(%i\\;iteracji)\\;$', data06it),...
    sprintf('$\\;\\omega = 1.0\\;\\;(%i\\;iteracji)\\;$', data10it)},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Relaksacja globalna','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('nr iteracji','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('S','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')


figure;
set(gcf, 'Position', get(0, 'Screensize'));
format long
dataM = readmatrix('globalnaErr_0.6.dat');
h = pcolor(dataM) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(dataM);
xticks(0:10:n);
yticks(0:10:m);
xt = get(gca, 'XTick');
set(gca, 'XTick',xt, 'XTickLabel',xt/10)
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt/10)
colormap(gca,'jet')
colorbar
title('$Relaksacja \;\; globalna \;:\; \omega = 0.6$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')


figure;
set(gcf, 'Position', get(0, 'Screensize'));
format long
dataM10 = readmatrix('globalnaErr_1.0.dat');
h = pcolor(dataM10) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(dataM10);
xticks(0:10:n);
yticks(0:10:m);
xt = get(gca, 'XTick');
set(gca, 'XTick',xt, 'XTickLabel',xt/10)
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt/10)
colormap(gca,'jet')
colorbar
title('$Relaksacja \;\; globalna \;:\; \omega = 1.0$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LOKALNA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data10 = readtable('lokalnaDat_1.0.dat');
data14 = readtable('lokalnaDat_1.4.dat');
data18 = readtable('lokalnaDat_1.8.dat');
data19 = readtable('lokalnaDat_1.9.dat');

figure;
set(gcf, 'Position', get(0, 'Screensize'));
plot(data10.Var1, data10.Var2, 'r', 'LineWidth', 5);
hold on;
plot(data14.Var1, data14.Var2, 'b', 'LineWidth', 5);
hold on;
plot(data18.Var1, data18.Var2, 'g', 'LineWidth', 5);
hold on;
plot(data19.Var1, data19.Var2, 'k', 'LineWidth', 5);
grid on;
xlim([0 12e3]);
set(gca, 'XScale', 'log');
data10it = max(data10.Var1) + 1;
data14it = max(data14.Var1) + 1;
data18it = max(data18.Var1) + 1;
data19it = max(data19.Var1) + 1;
legend({sprintf('$\\;\\omega = 1.0\\;\\;(%i\\;iteracji)\\;$', data10it),...
    sprintf('$\\;\\omega = 1.4\\;\\;(%i\\;iteracji)\\;$', data14it),...
    sprintf('$\\;\\omega = 1.8\\;\\;(%i\\;iteracji)\\;$', data18it),...
    sprintf('$\\;\\omega = 1.9\\;\\;(%i\\;iteracji)\\;$', data19it)},...
    'Location','best','Orientation','vertical','FontSize', 20, 'FontWeight', 'bold','Interpreter','latex');
title('Relaksacja lokalna','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('nr iteracji','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('S','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')










