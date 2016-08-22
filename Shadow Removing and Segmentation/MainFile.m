clc
clear
close all

binarizationThreshold=0.5;
contourThreshold=1;
offset=0;
resizeRatio=0.25;
numberOfIterations=500;
sampleSize=1000;                 % number of pixels in each sample to check the homogeneity


itemName='57.jpg';
imRGB=imread(itemName);

CutTheImage;
imshow(imRGB);

% Build orientation map to determine the initial mask of active contour
disp('Building orientation map ...')
MainFileOrientationMap;

% Resize the image
temp=round(resizeRatio*size(imRGB)); temp(3)=[];
imRGB = imresize(imRGB,temp);  %-- make image smaller 
turn=0;

CallingActiveContoursToDetermineNumberOfRegions;
ShadowRemoving;
imRGB=imRGB1;
figure
imshow(imRGB)

CallingActiveContoursToDetermineNumberOfRegions;
TransformIntoDifferentColorSpaces;

save res