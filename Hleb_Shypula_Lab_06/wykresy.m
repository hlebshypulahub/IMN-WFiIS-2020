clear; clc;

set(0,'DefaultAxesFontSize',15,'DefaultAxesFontName','Arial Cyr');

figure;

subplot(2,3,1);

% set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('V_1_eps1_1.000000_eps2_1.000000_nx_50_ny_50.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:10:n);
yticks(0:10:m);
colormap(gca,'jet')
colorbar
title('$nx=ny=50,\; \varepsilon _{1}=1,\; \varepsilon _{2}=1$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')
hcb=colorbar;
hcb.Title.String = "V";

subplot(2,3,2);

% set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('V_1_eps1_1.000000_eps2_1.000000_nx_100_ny_100.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:20:n);
yticks(0:20:m);
colormap(gca,'jet')
colorbar
title('$nx=ny=100$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')
hcb=colorbar;
hcb.Title.String = "V";

subplot(2,3,3);

% set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('V_1_eps1_1.000000_eps2_1.000000_nx_200_ny_200.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:50:n);
yticks(0:50:m);
colormap(gca,'jet')
colorbar
title('$nx=ny=200$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')
hcb=colorbar;
hcb.Title.String = "V";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,3,4);

% set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('V_0_eps1_1.000000_eps2_1.000000_nx_100_ny_100.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:20:n);
yticks(0:20:m);
c=colorbar();  
caxis([-0.8 0.8]); 
colormap(gca,'jet')
colorbar
title('$nx=ny=100,\; \varepsilon _{1}=1,\; \varepsilon _{2}=1$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')
hcb=colorbar;
hcb.Title.String = "V";

subplot(2,3,5);

% set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('V_0_eps1_1.000000_eps2_2.000000_nx_100_ny_100.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:20:n);
yticks(0:20:m);
c=colorbar();  
caxis([-0.8 0.8]); 
colormap(gca,'jet')
colorbar
title('$\varepsilon _{1}=1,\; \varepsilon _{2}=2$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')
hcb=colorbar;
hcb.Title.String = "V";

subplot(2,3,6);

% set(gcf, 'Position', get(0, 'Screensize'));
format long
data = readmatrix('V_0_eps1_1.000000_eps2_10.000000_nx_100_ny_100.dat');
h = pcolor(data) ;
set(h, 'EdgeColor', 'none');
[m, n] = size(data);
xticks(0:20:n);
yticks(0:20:m);
c=colorbar();  
caxis([-0.8 0.8]); 
colormap(gca,'jet')
colorbar
title('$\varepsilon _{1}=1,\; \varepsilon _{2}=10$','FontSize', 20, 'Color',...
    'k', 'FontWeight', 'bold','Interpreter','latex');
xlabel('x','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex') 
ylabel('y','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold','Interpreter','latex')
hcb=colorbar;
hcb.Title.String = "V";





