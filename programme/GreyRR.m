function r = GreyRR(x,y)
%计算序列x,y的灰色相对关联度，要求各序列第一个元素不能为0
%调用语法 r = GreyRR(x,y)
if ~(x(1)&&y(1))
    errordlg('序列首元素为0不能为0！')
    return
end
x = x/x(1);
y = y/y(1);
r = GreyAbsR(x,y);
