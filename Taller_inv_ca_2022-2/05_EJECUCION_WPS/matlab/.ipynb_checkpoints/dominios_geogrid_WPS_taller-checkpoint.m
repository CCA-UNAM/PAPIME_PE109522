%Programa para leer archivos netcdf y graficar variables meteoroloicas
clear;
clc;
close all;

load 'division_mexico.dat'

file_nc = '/Volumes/THUNDERBOLT/respaldo_mac/2_posdoctorado/proyecto_Pancho_2021/WRF/geogrid_dominios/10_2.5_MODIS/geo_em.d01.nc';
XLATdata = ncread(file_nc,'CLAT');
lat1 = XLATdata(:,:,1);
XLONGdata = ncread(file_nc,'CLONG');
long1 = XLONGdata(:,:,1);

%file_nc2 = '/Volumes/THUNDERBOLT/respaldo_mac/2_posdoctorado/proyecto_Pancho_2021/WRF/geogrid_dominios/10_2.5_MODIS/geo_em.d02.nc';
%XLATdata = ncread(file_nc2,'CLAT');
%lat2 = XLATdata(:,:,1);
%XLONGdata = ncread(file_nc2,'CLONG');
%long2 = XLONGdata(:,:,1);


figure('Position', [1 1 762 577])
hold on
plot(long1(1,:),lat1(1,:),'Color','r','LineWidth',3)
plot(long1(:,1),lat1(:,1),'Color','r','LineWidth',3)
plot(long1(end,:),lat1(end,:),'Color','r','LineWidth',3)
plot(long1(:,end),lat1(:,end),'Color','r','LineWidth',3)
grid on
%Se comentan por el cluster
%S1=shaperead('/Volumes/THUNDERBOLT/arcgis/Megalopolis/edos_mega.shp');
%mapshow(S1,'FaceColor',[1.0,0.7,0.7],'EdgeColor', [1.0,0.7,0.7])

plot(division_mexico(:,1),division_mexico(:,2),'k','LineWidth',1.5)
xlim([-104 -94]);
ylim([15 24]);
box on
set(gca,'FontSize',18,'FontWeight', 'bold');
ax = gca;
ax.LineWidth = 2.0
ylabel('Latitude', 'FontSize',18, 'FontWeight', 'bold');
xlabel('Longitude', 'FontSize',18, 'FontWeight', 'bold');
text(-102,16.4,'Domain 1','Color','r','FontSize',20,'FontWeight','bold')

%plot(long2(1,:),lat2(1,:),'Color','b','LineWidth',3)
%plot(long2(:,1),lat2(:,1),'Color','b','LineWidth',3)
%plot(long2(end,:),lat2(end,:),'Color','b','LineWidth',3)
%plot(long2(:,end),lat2(:,end),'Color','b','LineWidth',3)
%text(-100,17.5,'Domain 2','Color','b','FontSize',20,'FontWeight','bold');

set(gcf,'PaperPositionMode','auto')
saveas(gcf,'domain_geogrid_taller','tiff')




