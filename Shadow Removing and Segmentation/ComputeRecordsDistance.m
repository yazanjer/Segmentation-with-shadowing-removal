function recordsDis=ComputeRecordsDistance(features,C,idx)
k=size(C,1);
recordsDis=0;
for i=1:k
    xi=features(idx==i,:);
    cen=repmat(C(i,:),size(xi,1),1);
    dis=sqrt(sum((xi-cen).^2,2));
    recordsDis=recordsDis+sum(dis);
end

end