%% Collinearity Equations: 
% % Created by Dr.Maan Okayli
% % Last Editied: Oct. 22, 2022
% this function is uses the collinearity equation in the applications of
% Photogrammetry, such as Resection and Intersection
% output of this function would be 2x1 vector

function F = collin2(foc,eop,M,xpp,ypp,XYZ)
XL = eop(2,1);
YL = eop(2,2);
ZL = eop(2,3);
X = XYZ(1);
Y = XYZ(2);
Z = XYZ(3);
DX=[X-XL;Y-YL;Z-ZL];
UVW = M*DX;
Fx=xpp + foc*(UVW(1)/UVW(3));
Fy=ypp + foc*(UVW(2)/UVW(3));
F=[Fx;Fy];
end