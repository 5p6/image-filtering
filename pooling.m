function f=pooling(g,b)
[x,y]=size(g);
[x1,y1]=size(b);
x2=fix(x/x1);y2=fix(y/y1);
f=zeros(x2,y2);
if mod(x1,2)~=0
   for i=(x1-1)/2+1:(x1-1)/2:x-(x1-1)/2
      for j=(y1-1)/2+1:(y1-1)/2:y-(y1-1)/2
        g_s=g(i-(x1-1)/2:i+(x1-1)/2,j-(y1-1)/2:j+(y1-1)/2);
        f((i-1)/((x1-1)/2),(j-1)/((y1-1)/2))=max(max(g_s));
      end
   end
else
    for i=x1:x1:x
        for j=y1:y1:y
        g_s=g(i-(x1-1):i,j-(y1-1):j);
        f(i/x1,j/y1)=max(max(g_s));
        end
    end
end
end