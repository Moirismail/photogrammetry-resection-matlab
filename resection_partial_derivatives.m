%% Partial Derivatives for Resection Problem
% % Created by: Dr.Maan Okayli
% % Last Editied: Jan. 22, 2023
% partial derivatives function for resection peroblem (numerically): 
% this function return a matrix with 2x6
% matrix columns arrangment are:
% dFdobs = [dFdw dFdphi dFdkappa dFdXL dFdYL dFdZL]

function dFdpar = resection_partial_derivatives(foc,eop,M,xpp,ypp,XYZ)

F = collin2(foc,eop,M,xpp,ypp,XYZ);
ddx = 1e-4;
eop_pos = eop(2,:);
eop_ori = eop(1,:);
for i = 1 : 3
    eop_pos1 = eop_pos;
    eop_pos1(i) = eop_pos1(i) + ddx;
    eop1 = [eop_ori;eop_pos1];
    Fp = collin2(foc,eop1,M,xpp,ypp,XYZ);
    dxp(1,i) = (Fp(1)-F(1))/ddx;
    dyp(1,i) = (Fp(2)-F(2))/ddx;
end
for i = 1 : 3
    eop_ori1 = eop_ori;
    eop_ori1(i) = eop_ori1(i) + ddx;
    M1 = rotationmatrix(eop_ori1(1),eop_ori1(2),eop_ori1(3));
    eop1 = [eop_ori1;eop_pos];
    Fp = collin2(foc,eop1,M1,xpp,ypp,XYZ);
    dxo(1,i) = (Fp(1)-F(1))/ddx;
    dyo(1,i) = (Fp(2)-F(2))/ddx;
end
dx = [dxo dxp];
dy = [dyo dyp];
dFdpar = [dx;dy];

end