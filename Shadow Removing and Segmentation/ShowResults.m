close all

label=bwlabel(seg);
imGray=rgb2gray(imRGB);

I1I2I3=rgb2OHTA(imRGB);
I1I2I3Chapoo=rgb2OHTA2(imRGB);

I2=I1I2I3(:,:,2);
I2Chapoo=I1I2I3Chapoo(:,:,2);

imLab=rgb2lab(imRGB);
L=imLab(:,:,1);aStar=imLab(:,:,2);bStar=imLab(:,:,3);
L(label~=1)=0;
imGray(L<50)=255;
imshow(imGray);
