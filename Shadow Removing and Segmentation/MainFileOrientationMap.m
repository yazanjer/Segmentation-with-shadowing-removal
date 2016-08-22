% The mathematical Model of the Retinal Ganglion Cells

% Parameters of RF cell

% For center gaussian function
vc=4;            % The ratio r/sigma : vc must be >= 4 refer to the paper
rc=5;            % Radius of the center
sigmaC=rc/vc;    % standard deviation of the center
xc=-rc:rc;
yc=-rc:rc;
[xc,yc]=meshgrid(xc,yc);
zc=GaussFunc(sigmaC,xc,yc);

% For surround gaussian function
vs=10;            % The ratio r/sigma : vs must be >= 4 refer to the paper
rs=15;           % Radius of the surround
sigmaS=rs/vs;    % standard deviation of the surround
xs=-rs:1:rs;
ys=-rs:1:rs;
[xs,ys]=meshgrid(xs,ys);
zs=GaussFunc(sigmaS,xs,ys);

% center/surround ratio
rt=rc/rs;
% Compute response function
[respFunc,etaVal]=ComputeNormalizedRespFunc(rt);
% Maximum error
eMax=400;
%figure;plot(respFunc)

% Main Parameters
interval=3;          % distance between two cells in pixel
windowSize=88;         % unit is pixel
winBorder=windowSize+2*rs;
xi=1:interval:windowSize;
yi=1:interval:windowSize;
rfNum=length(xi)*length(yi);

% User image

[n,m,dim]=size(imRGB);
while mod(size(imRGB,1),windowSize)~=0
    imRGB(end,:,:)=[];
end
while mod(size(imRGB,2),windowSize)~=0
    imRGB(:,end,:)=[];
end
% Apply median filter for removing noise
imBin=im2bw(imRGB,binarizationThreshold);
imBin=medfilt2(imBin,[11 11]);
imBin=medfilt2(imBin,[9 9]);
imBin=medfilt2(imBin,[7 7]);
imBinTemp=imBin;

big=1;
while rs>big*windowSize
    big=big+1;
end

imRGB=ConvertBackgroundColorIntoWhiteOrBlack(imRGB,imBin,1);

% Apply median filter for removing noise
imBin=im2bw(imRGB,binarizationThreshold);
imBin=medfilt2(imBin,[11 11]);
imBin=medfilt2(imBin,[9 9]);
imBin=medfilt2(imBin,[7 7]);
imBin=padarray(imBin,[big*windowSize big*windowSize],1);

% Call Orientation Map code
OrientationMap

% Find the squares that have line
index=find(~isnan(k));

% Convert each line segment into a node
[nodes,adjMat]=GeneratingNodes(k,b,windowSize,index);

% Find the initial contours
threshold=windowSize/8;
initContour=InitialContours(adjMat,threshold);
