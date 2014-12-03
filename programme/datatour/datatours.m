load('C:\Users\Administrator\Documents\数据挖掘项目\dataset\commerce.mat')
data=[totaltotal,totale,totalbm,ebm,totalca,eca,totalch,ech,totalcs,ecs,totaldhb,edhb,totalea,eea,totalfbw,efbw,totalff,eff,totalmv,emv,totaloes,eoes,totalsg,esg,totalthg,ethg,totalom,eom,totalnr,enr];
x = data;
maxit = 10000;
[n,p] = size(x);
% Set up vector of frequencies as in grand tour.
th = mod(exp(1:p),1);
% This is a small irrational number:
delt = exp(-5);
cof = sqrt(2/p);
% Set up storage space for projection vectors.
a = zeros(p,1); b = zeros(p,1);
z = zeros(n,2);
% Get an initial plot.
ph = plot(z(:,1),z(:,2),'o','erasemode','normal');
axis equal, axis off
set(gcf,'backingstore','off','renderer',...
'painters','DoubleBuffer','on')
for t = 0:delt:(delt*maxit)
% Find the transformation vectors.
for j = 1:p/2
a(2*(j-1)+1) = cof*sin(th(j)*t);
a(2*j) = cof*cos(th(j)*t);
b(2*(j-1)+1) = cof*cos(th(j)*t);
b(2*j) = cof*(-sin(th(j)*t));
end
% Project onto the vectors.
z(:,1) = x*a;
z(:,2) = x*b;
set(ph,'xdata',z(:,1),'ydata',z(:,2))
drawnow
end

