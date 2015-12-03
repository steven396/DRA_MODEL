function PlotDegreeOfEveryPhotoreceptors(phi_sun,theta_sun,headDirection)
% [MatrixOfDegree,x,y,z]=DegreeForEveryPhotoreceptors(phi_sun,theta_sun,headDirection);
[MatrixOfDegree,x,y,z]=forPlotDegreeForEveryPhotoreceptors(phi_sun,theta_sun,headDirection,36,2);
h0=figure;
set(h0,'Position',[0,0,3000,2000]);

for i=1:72
    subplot(8,9,i);
    surf(x,y,z,MatrixOfDegree(:,:,i),'EdgeColor','none');
    shading interp;
    grid on;
    axis equal;
    axis ([-1,1,-1,1]);
%     caxis([0,1]);
    title(sprintf('No.%d photoreceptor',i),'FontSize',8);
%     h=colorbar;
%     set(h,'Ylim',[0,1]);
end

% plot all eyes together
% kkkkk=MatrixOfDegree(:,:,1);
% for i=2:72   
%     kkkkk=kkkkk+MatrixOfDegree(:,:,i);
% end
% 
% % surf(x,y,z,kkkkk,'EdgeColor','none');
% pcolor(x,y,kkkkk);
% shading interp;
% grid on;
% axis equal;
% axis ([-1,1,-1,1]);
% 
% title(sprintf('No.%d photoreceptor',i),'FontSize',8);

