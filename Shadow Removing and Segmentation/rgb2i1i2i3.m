function I1I2I3=rgb2i1i2i3(imRGB)
imRGB=double(imRGB);
R=imRGB(:,:,1);R=R/255;
G=imRGB(:,:,2);G=G/255;
B=imRGB(:,:,3);B=B/255;

I1=(R+G+B)/3;
I2=(R-B)/2;
I3=(2*G-R-B)/4;

I1I2I3=zeros(size(imRGB));
I1I2I3(:,:,1)=I1;
I1I2I3(:,:,2)=I2;
I1I2I3(:,:,3)=I3;
end