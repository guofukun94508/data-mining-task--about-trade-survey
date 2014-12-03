function r = GreyUniR(x,y)
%计算序列x,y的灰色归一关联度
%调用语法 r = GreyUniR(x,y)
xsize = size(x);
ysize = size(y);
if (min(xsize)~=1)||(min(ysize)~=1)
    errordlg('x或y必须是向量！');
    return
end
if xsize(2) == 1 %列向量的话转化成行向量
    x=x';    
end
if ysize(2) == 1
    y=y';    
end
xyminmax = minmax([x;y]);
x = (x-xyminmax(1,1))/(xyminmax(1,2)-xyminmax(1,1));%归一化
y = (y-xyminmax(2,1))/(xyminmax(2,2)-xyminmax(2,1));
r = GreyAbsR(x,y);
