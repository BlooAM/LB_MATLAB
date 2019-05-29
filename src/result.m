figure(1)
set(gcf, 'Position', [10, 10, 1280, 720],'color',[0.8 0.8 0.8])
% trisurf(tri,X,Y,sqrt(u'.^2+v'.^2))
trisurf(tri,X,Y,(u.^2+v.^2)')
shading('interp')
colormap('jet')
colorbar
axis image
view([0 90])
% frame = getframe(gcf);
% writeVideo(video1,frame);
drawnow

% figure(2)
% set(gcf, 'Position', [10, 10, 1280, 720],'color',[0.8 0.8 0.8])
% trisurf(tri,X,Y,rho')
% shading('interp')
% colormap('jet')
% colorbar
% axis image
% view([0 90])
% % ylim([0,0.5])
% drawnow
% frame = getframe(gcf);
% writeVideo(video2,frame);

% figure(3)
% set(gcf, 'Position', [10, 10, 1280, 720],'color',[0.8 0.8 0.8])
% trisurf(tri,X,Y,u')
% shading('interp')
% colormap('jet')
% colorbar
% axis image
% view([0 90])
% % ylim([0,0.5])
% drawnow
% frame = getframe(gcf);
% writeVideo(video3,frame);
% 
% figure(4)
% set(gcf, 'Position', [10, 10, 1280, 720],'color',[0.8 0.8 0.8])
% trisurf(tri,X,Y,v')
% shading('interp')
% colormap('jet')
% colorbar
% axis image
% view([0 90])
% % ylim([0,0.5])
% drawnow
% frame = getframe(gcf);
% writeVideo(video4,frame);
