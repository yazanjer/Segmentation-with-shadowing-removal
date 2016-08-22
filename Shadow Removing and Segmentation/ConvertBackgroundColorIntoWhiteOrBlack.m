function imRGB=ConvertBackgroundColorIntoWhiteOrBlack(imRGB,imBin,blackOrWhite)
imBin=1-imBin;
label=bwlabel(imBin);
r1=imRGB(:,:,1);
r2=imRGB(:,:,2);
r3=imRGB(:,:,3);
if  blackOrWhite==1
    r1(label==1)=255;
    r2(label==1)=255;
    r3(label==1)=255;
elseif blackOrWhite==0
    r1(label==1)=0;
    r2(label==1)=0;
    r3(label==1)=0;
end
imRGB(:,:,1)=r1;
imRGB(:,:,2)=r2;
imRGB(:,:,3)=r3;
end
