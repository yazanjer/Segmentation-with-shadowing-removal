
disp('Create the initial mask ...')
mask=CreateMask(imBin,initContour,nodes,contourThreshold,offset);

imOmapRGB=255*ones(size(imOut,1),size(imOut,2),3,'uint8');
tempMask=mask;
tempMask(~imOut)=0;
r=255*ones(size(imOut),'uint8');r(~imOut)=0;r(tempMask)=150;
g=255*ones(size(imOut),'uint8');g(~imOut)=0;g(tempMask)=200;
b=255*ones(size(imOut),'uint8');b(~imOut)=0;b(tempMask)=90;
imOmapRGB(:,:,1)=r;
imOmapRGB(:,:,2)=g;
imOmapRGB(:,:,3)=b;
figure(10)
%imshow(imOmapRGB)

mask=imresize(mask,temp);
imshow(mask)

figure(11)
subplot(2,2,1); imshow(imRGB); title('Input Image');

subplot(2,2,2); imshow(mask); title('Initialization');
subplot(2,2,3); title('Segmentation');

disp('Call active contours ...');
seg = region_seg(imRGB, mask, numberOfIterations); %-- Run segmentation
subplot(2,2,4); 
imshow(seg);title('Global Region-Based Segmentation');
pause(0.1);

% Return to the true color of background
imBinTemp1=imresize(imBinTemp,temp);
imRGB=ConvertBackgroundColorIntoWhiteOrBlack(imRGB,imBinTemp1,0);
%clear imBinTemp

disp('Determine the initial number of regions ...')
label = bwlabel(seg);    % Labeling the photo
% Check how many regions we have based on labeling the image after active
% contours
numberOfRegions=0;
regionLabels=zeros(1,5);
i=1;
num=length(find(label==i));
while num~=0
    if num>10
        numberOfRegions=numberOfRegions+1;
        regionLabels(numberOfRegions)=i;
    end
    i=i+1;
    num=length(find(label==i));
end
regionLabels(regionLabels==0)=[];

