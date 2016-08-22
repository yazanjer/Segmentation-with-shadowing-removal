close all
% Remove any details other than the required region
label=bwlabel(seg);
imRGB1=zeros(size(imRGB),'uint8');
R=imRGB(:,:,1);R=medfilt2(R,[3 3]);R(label~=1)=255;imRGB1(:,:,1)=R;
G=imRGB(:,:,2);G=medfilt2(G,[3 3]);G(label~=1)=255;imRGB1(:,:,2)=G;
B=imRGB(:,:,3);B=medfilt2(B,[3 3]);B(label~=1)=255;imRGB1(:,:,3)=B;

imYCbCr=rgb2ycbcr(imRGB1);
Y=imYCbCr(:,:,1);
cb=imYCbCr(:,:,2);
cr=imYCbCr(:,:,3);

imLab=rgb2lab(imRGB1);
l=imLab(:,:,1);
a=imLab(:,:,2);
b=imLab(:,:,3);

imHSV=rgb2hsv(imRGB1);
h=imHSV(:,:,1);

rDif=diff(R,1);rDif=double(rDif);
gDif=diff(G,1);gDif=double(gDif);
bDif=diff(B,1);bDif=double(bDif);

imGrad=sqrt(rDif.^2+gDif.^2+bDif.^2);


imGray=rgb2gray(imRGB1);
imGray1=imGray;
threshold=90;

for i=1:size(imGrad,2)
    col=imGrad(:,i);
    ind=find(col~=0,1);
    if isempty(ind)
        continue;
    end
    maxVal=max(col);
    if maxVal>threshold
        ind=find(col==maxVal);
        counter=0;
        while counter<5
            counter=counter+1;
            ind=ind-1;
            if col(ind)==0 
                break;
            end
        end
        %imGray(ind:end,i)=255;
        while imGray(ind,i)~=255
            imGray(ind,i)=255;
            ind=ind+1;
        end
    end
end
imGray=medfilt2(imGray,[3 3]);
imGray=medfilt2(imGray,[5 5]);
imGray=medfilt2(imGray,[9 9]);

subplot(1,2,1)
imshow(imRGB1)

R(imGray==255)=255;
G(imGray==255)=255;
B(imGray==255)=255;
imRGB1(:,:,1)=R;
imRGB1(:,:,2)=G;
imRGB1(:,:,3)=B;

subplot(1,2,2)
imshow(imRGB1)
