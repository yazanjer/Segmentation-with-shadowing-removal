function I1I2I3Chapoo=rgb2OHTA2(imRGB)

R=imRGB(:,:,1);
G=imRGB(:,:,2);
B=imRGB(:,:,3);

I1=(R+G+B)/3;
I2=(R-B);
I3=(2*G-R-B)/2;

I1I2I3Chapoo=zeros(size(imRGB),'uint8');
I1I2I3Chapoo(:,:,1)=I1;
I1I2I3Chapoo(:,:,2)=I2;
I1I2I3Chapoo(:,:,3)=I3;

end