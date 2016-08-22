function imRGB1=ShowWindowOnTheImage(imRGB,pixelsInd)
imRGB1=imRGB;

r=imRGB1(:,:,1);
g=imRGB1(:,:,2);
b=imRGB1(:,:,3);


r(pixelsInd)=ceil(255*rand);
g(pixelsInd)=ceil(255*rand);
b(pixelsInd)=ceil(255*rand);

imRGB1(:,:,1)=r;
imRGB1(:,:,2)=g;
imRGB1(:,:,3)=b;
end