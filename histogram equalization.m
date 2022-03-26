function picure=equal(g) %%   直方图均衡化 无论输入进来的图像分量g是double类型的
x=size(g,1);y=size(g,2); %% 还是uint8类型的，输出的picure都是uint8类型的
g=im2uint8(g);
g_r=imhist(g)./(x*y);
s=zeros(256,1);
picure=im2uint8(zeros(x,y));
for i=1:256
    for u=1:i
    s(i)=s(i)+g_r(u);
    end
end
S=im2uint8(s);
for i=1:x
    for j=1:y
        for u=1:256
        if g(i,j)==u
            picure(i,j)=S(u);
        end
        end
    end
end

end
