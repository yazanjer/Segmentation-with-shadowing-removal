function imOut=DrawShortLine(imOut,k,b,winSize,i,j,lineWidth)
if isnan(k)
    return;
end
for offset=-lineWidth:lineWidth
    if ~isinf(k)
         x=1+(j-1)*winSize:j*winSize;
         yWin=1+(i-1)*winSize:i*winSize;
         y=k.*x+b+offset;
         x(y<yWin(1) | y>yWin(end))=[];
         y(y<yWin(1) | y>yWin(end))=[];
         ind=sub2ind(size(imOut),round(y),x);
         imOut(ind)=0;
    end
end
end