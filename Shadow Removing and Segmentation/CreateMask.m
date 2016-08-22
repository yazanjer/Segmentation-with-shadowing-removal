function mask=CreateMask(imBin,initContour,nodes,contourThreshold,offset)

mask=false(size(imBin));
for i=1:length(initContour)
    if length(initContour{i})>contourThreshold
        initCont=initContour{i};
        x=zeros(length(initCont)*2,1);
        y=zeros(length(initCont)*2,1);
        counter=0;
        for j=1:length(initCont)
            node=nodes(initCont(j));
            counter=counter+1;
            x(counter)=node.start(1);
            y(counter)=node.start(2);
            counter=counter+1;
            x(counter)=node.end(1);
            y(counter)=node.end(2);
        end
        mask(min(y)+offset:max(y)-offset,min(x)+offset:max(x)-offset)=true;
    end
end

end
