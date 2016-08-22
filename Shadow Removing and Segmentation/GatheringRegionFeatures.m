f1=R(reqRegInd);
f2=G(reqRegInd);  
f3=B(reqRegInd);
% YIQ features
f4=Y1(reqRegInd);
f5=I(reqRegInd);
f6=Q(reqRegInd);
% YUV features
f7=Y2(reqRegInd);
f8=U(reqRegInd);
f9=V1(reqRegInd);
% I1I2I3 features
f10=I1(reqRegInd);
f11=I2(reqRegInd);
f12=I3(reqRegInd);
% Normalized RGB features
f13=r(reqRegInd);
f14=g(reqRegInd);
f15=b(reqRegInd);
% HSV features
f16=H(reqRegInd);
f17=S(reqRegInd);
f18=V2(reqRegInd);
% YCbCr features
f19=Y3(reqRegInd);
f20=Cb(reqRegInd);
f21=Cr(reqRegInd);
% L*a*b* features
f22=L(reqRegInd);
f23=aStar(reqRegInd);
f24=bStar(reqRegInd);

[row,col]=ind2sub(size(label),reqRegInd);
features=[f10 f11 f12 f13 f14 f15 f16 f20 f21 f23 f24 row/size(label,1) col/size(label,2)];
clear f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 f20 f21 f22 f23 f24 
