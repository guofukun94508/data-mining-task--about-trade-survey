function [a,w] = DataFusionS(x)
%对于多次测量或者预测组成的x的观察值进行结果融合；
%x为行向量。
%返回值：a,融合结果；w，x中每个分量在生成a的时候所占的权重
%调用格式[a,w] = DataFusionS(x);
Lx = length(x);
switch Lx
    case 0 
        a = 0;
        w = [];
    case 1
        a = x;
        w = 1;
    case 2
        a = mean(x);
        w = [1/2,1/2];
    otherwise
        DataCombine = nchoosek(1:length(x),2);%x元素两两之间可能的所有组合方式
        d = abs( x(DataCombine(:,1))-x(DataCombine(:,2)) );
        maxd = max(d);
        [Y,X] = meshgrid(1:Lx,1:Lx);
        R =  cos(pi*( x(X)-x(Y) )/(2*maxd)); %构造支持度矩阵       
        [V,D] = eig(R);
        w = V(:,Lx)/sum(V(:,Lx));
        a = x*w;
end