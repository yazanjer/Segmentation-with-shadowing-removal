
imBin=im2bw(imRGB,binarizationThreshold);
imBin=medfilt2(imBin,[11 11]);
imBin=medfilt2(imBin,[9 9]);
imBin=medfilt2(imBin,[7 7]);
label=bwlabel(imBin);
num=1;
[rowsCut,colsCut]=find(label==num);
while length(rowsCut)<10000
     index=find(label==num);
     r1=imRGB(:,:,1);
     r2=imRGB(:,:,2);
     r3=imRGB(:,:,3);

     r1(index)=0;
     r2(index)=0;
     r3(index)=0;

     imRGB(:,:,1)=r1;
     imRGB(:,:,2)=r2;  
     imRGB(:,:,3)=r3;
     
     num=num+1;
     [rowsCut,colsCut]=find(label==num);
end
imRGB(max(rowsCut)+150:end,:,:)=[];
imRGB(:,max(colsCut)+150:end,:)=[];

imBin(max(rowsCut)+150:end,:)=[];
imBin(:,max(colsCut)+150:end)=[];
