imBin=seg;
[rows,cols,dim]=size(imRGB);

R=imRGB(:,:,1);
G=imRGB(:,:,2);
B=imRGB(:,:,3);

% Convert RGB image into Gray image
imGray=double(rgb2gray(imRGB));

% Convert RGB image into YIQ image
imYIQ = rgb2ntsc(imRGB);
Y1=imYIQ(:,:,1);I=imYIQ(:,:,2);Q=imYIQ(:,:,3);
clear imYIQ 

% Convert RGB image into YUV image
imYUV=rgb2yuv(imRGB);
Y2=imYUV(:,:,1);U=imYUV(:,:,2);V1=imYUV(:,:,3);
clear imYUV

% Convert RGB image into I1I2I3 image
imI1I2I3=rgb2i1i2i3(imRGB);
I1=imI1I2I3(:,:,1);I2=imI1I2I3(:,:,2);I3=imI1I2I3(:,:,3);
clear imI1I2I3

% Convert RGB image into Normalized RGB image
imNormRGB=rgb2normRGB(imRGB);
r=imNormRGB(:,:,1);g=imNormRGB(:,:,2);b=imNormRGB(:,:,3);
clear imNormRGB

% Convert RGB image into HSV image
imHSV=rgb2hsv(imRGB);
H=imHSV(:,:,1);S=imHSV(:,:,2);V2=imHSV(:,:,3);
clear imHSV 

% Convert RGB image into YCbCr image
imYCbCr=rgb2ycbcr(imRGB);
Y3=double(imYCbCr(:,:,1));Cb=double(imYCbCr(:,:,2));Cr=double(imYCbCr(:,:,3));
clear imYCbCr

% Convert RGB image into L*a*b* image 
%L in [0, 100]
%A in [-86.185, 98,254]
%B in [-107.863, 94.482]
imLab=rgb2lab(imRGB);
L=imLab(:,:,1);aStar=imLab(:,:,2);bStar=imLab(:,:,3);
clear imLab
