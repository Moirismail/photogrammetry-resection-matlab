% Construct the 3D Rotation matrix with the order of (w,phi,k)
% All the angles must be in radians
% output of this function would be 3x3 matrix (M)

function M = rotationmatrix(omega,phi,kappa)

Mw = [1 0 0;0 cos(omega) sin(omega);0 -sin(omega) cos(omega)];
Mph = [cos(phi) 0 -sin(phi);0 1 0;sin(phi) 0 cos(phi)];
Mk = [cos(kappa) sin(kappa) 0;-sin(kappa) cos(kappa) 0;0 0 1];


M = Mk*Mph*Mw;


end