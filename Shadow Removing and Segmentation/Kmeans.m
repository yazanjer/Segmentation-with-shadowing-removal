function [idx,centers]=Kmeans(data,numberOfClusters,dist)
% Dimention of data set
rows=size(data,1);
cols=size(data,2);

centers=zeros(numberOfClusters,cols);
% Initialize the clusters
idx=randi(numberOfClusters,rows,1);

% Compute the centers of the initial clusters
for i=1:numberOfClusters
    centers(i,:)=mean(data(idx==i,:));
end
clear idx

distances=zeros(rows,numberOfClusters);
%covMat=nancov(data);covMat=eye(size(covMat))/covMat;
while true
    % Compute new distances from the centers
    for i=1:numberOfClusters    
        distances(:,i)=pdist2(data,centers(i,:),dist);
        %cen=repmat(centers(i,:),rows,1);dif=data-cen;clear cen;temp1=dif*covMat;temp2=dif';clear dif;distances(:,i)=sqrt(sum(temp1*temp2,2));
    end
    [val,idx]=min(distances,[],2);
    % Update the centers
    temp=centers;
    for i=1:numberOfClusters
        centers(i,:)=mean(data(idx==i,:));
        if isnan(centers(i,:))
            error('Empty cluster, choose another distance')
        end
    end
    if temp==centers
        break;
    end
end


end