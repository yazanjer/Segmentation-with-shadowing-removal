function YUV=rgb2yuv(imRGB)
imRGB=double(imRGB);
R=imRGB(:,:,1);R=R/255;
G=imRGB(:,:,2);G=G/255;
B=imRGB(:,:,3);B=B/255;

Y=0.299*R+0.587*G+0.114*B;
U=-0.147*R-0.289*G+0.436*B;
V=0.615*R-0.515*G-0.1*B;

YUV=zeros(size(imRGB));
YUV(:,:,1)=Y;
YUV(:,:,2)=U;
YUV(:,:,3)=V;
end