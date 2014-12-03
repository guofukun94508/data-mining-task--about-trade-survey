function pre = GM11(x)
%x,建模数据序列x = [x(1),x(2),...,x(n)]
% pre,由GM11模型得到的预测值，即由x估计出的x(n+1)
n = length(x);
x1 = cumsum(x);
z1 = (x1(1:n-1)+x1(2:n))/2;
Y = x(2:length(x))';
B = [-z1',ones(n-1,1)];
A = (B'*B)\B'*Y;%GM(1,1)模型的a,b参数组成的向量.
beta = A(2)/(1+.5*A(1));
alpha = A(1)/(1+.5*A(1));
%初始序列x0(k)模拟后的随时间t变化的序列
f = @(t)(beta-(alpha)*x(1))*exp(-(A(1)*(t-2)));
pre = f(n+1);