function  a=flexable_var(g,ranks) %会计算矩阵g的ranks×ranks的邻域的方差
relax=ranks-1;
[x,y]=size(g);
g_s=im2double(g);
section=zeros(x+relax,y+relax);
section(relax/2+1:x+relax/2,1+relax/2:relax/2+y)=g_s;
u=zeros(x,y);
for i=(1+relax/2):(x+relax/2)    
    for j=(1+relax/2):(y+relax/2)
        u(i-relax/2,j-relax/2)=sum(sum(section(i-relax/2:i+relax/2,j-relax/2:j+relax/2)))/9;
    end
end
a=zeros(x,y);
for i=(1+relax/2):(x+relax/2)
    for j=(1+relax/2):(y+relax/2)
        a(i-relax/2,j-relax/2)=sum(sum((section(i-relax/2:i+relax/2,j-relax/2:j+relax/2)-u(i-relax/2,j-relax/2)).^2))/9;
    end
end
end