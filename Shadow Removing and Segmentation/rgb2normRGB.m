function normRGB=rgb2normRGB(imRGB)
imRGB=double(imRGB);
R=imRGB(:,:,1);
G=imRGB(:,:,2);
B=imRGB(:,:,3);

r=R./(R+G+B);
g=G./(R+G+B);
b=B./(R+G+B);

normRGB=zeros(size(imRGB));
normRGB(:,:,1)=r;
normRGB(:,:,2)=g;
normRGB(:,:,3)=b;

end