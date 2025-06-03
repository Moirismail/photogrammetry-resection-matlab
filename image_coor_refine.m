%% Refine the image observations from (x,y) to (x'',y'') 
% % Created by: Dr.Maan Okayli
% % Last editied: Oct. 22,2022
% this function make the necessary correction for the observations from the
% lens distortion
% output of this function would be 1x2, which represents x'' and y''

function [xpp,ypp] = image_coor_refine(p)
% Use this function to refine the image coordinates 
    x=p(1);
    y=p(2);
    x0=p(3);
    y0=p(4);
    foc=p(5);
    k1=p(6);
    k2=p(7);
    k3=p(8);
    p1=p(9);
    p2=p(10);
    ncol=p(11);
    nrow=p(12);
    
    maxr=sqrt((nrow/2)^2 + (ncol/2)^2);
    xp=x-x0;
    yp=y-y0;
    r2=xp^2 + yp^2;
    r=sqrt(r2);

    c1=1/(maxr^2);
    c2=1/(maxr^4);
    c3=1/(maxr^6);

    dr=c1*k1*r2 + c2*k2*r2^2 + c3*k3*r2^3;
    dxr=dr*xp;
    dyr=dr*yp;

    dxd=c1*p1*(r2 + 2*xp^2) + 2*c1*p2*xp*yp;
    dyd=2*c1*p1*xp*yp + c1*p2*(r2 + 2*yp^2);

    xpp=xp+dxr+dxd;
    ypp=yp+dyr+dyd;

end