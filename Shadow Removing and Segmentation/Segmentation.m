clc
clear
close all

load res

homogeneityThreshold=0.03;     % To determine if a region is homogeneus or not
numOfRegThreshold=0.74;        % To determine the number of regions
seed=3;
rng(seed);
dist='euclidean';
%dist='seuclidean';
%dist='sqEuclidean';
%dist='mahalanobis';
%dist='cityblock';
%dist='cosine';
%dist='correlation';
%dist='minkowski';
%dist='chebychev';
% Determine number of objects in each region
regionMatrix=zeros(numberOfRegions,1);
for i=1:numberOfRegions
    % Get the indices of the region i
    reqRegInd=find(label==i);
    GatheringRegionFeatures;
    varCounter=0;
    for j=1:10
        randIndex=ceil(length(reqRegInd)*rand(1,sampleSize));
        variance=var(features(randIndex,:));
        if sqrt(sum(variance.^2))<homogeneityThreshold
            varCounter=varCounter+1;
        end
    end
    if varCounter>=7
        % Number of objects is one
        regionMatrix(i)=1;
    else
        % Number of objects is bigger than one
        % Maximum number of objects 5
        recordsDis=zeros(1,5);
        for j=1:6
            %[idx,C]=kmeans(features,j);
            [idx,C]=Kmeans(features,j,'seuclidean');%,'distance',dist);
        
            recordsDis(j)=ComputeRecordsDistance(features,C,idx);
            if j>1
                if recordsDis(j)>recordsDis(j-1)
                    per=recordsDis(j-1)/recordsDis(j);
                else
                    per=recordsDis(j)/recordsDis(j-1);
                end
                if per>numOfRegThreshold
                    regionMatrix(i)=j-1;
                    break;
                end    
            end
        end     
    end
end

% Segmentation process
imRGB2=255*ones(size(imRGB),'uint8');
counter=0;
items=cell(1,5);
for i=1:numberOfRegions
    reqRegInd=find(label==i);
    if regionMatrix(i)>1
        GatheringRegionFeatures;
        %[idx,C]=kmeans(features,regionMatrix(i),'distance',dist);
        [idx,C]=Kmeans(features,regionMatrix(i),dist);%,'distance',dist);
        %idx=clusterdata(features,'linkage','average','savememory','off','maxclust',regionMatrix(i));
        for j=1:regionMatrix(i)
            itemInd=reqRegInd(idx==j);
            imRGB2=ShowWindowOnTheImage(imRGB2,itemInd);
            counter=counter+1;
            items{counter}=itemInd;
            
        end
    else
        imRGB2=ShowWindowOnTheImage(imRGB2,reqRegInd);
        counter=counter+1;
        items{counter}=reqRegInd;    
    end
end
figure(9)
imshow(imRGB2);
str2=['Number of items : ' num2str(counter)];

