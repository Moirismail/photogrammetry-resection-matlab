%% navigate to the point on an image(zoom, pan, etc.)
% % Created by Dr.Maan Okayli (with curtesy to Dr.James Bethel)
% % Last Editing: Oct. 22, 2022
% in matlab, browse to folder where the images are located
% will either open a new file, or append to an existing file
% when done, enter "quit" for ID, then click anywhere
%% 
s=input('enter image filename ','s');
% open file for coordinates
[m,n]=size(s);
s1 = s;
so=s;
s1(n+1) = '.';
s1(n+2) = 'j';
s1(n+3) = 'p';
s1(n+4) = 'g';

so(n+1)='.';
so(n+2)='t';
so(n+3)='x';
so(n+4)='t';

fid=fopen(so,'a+');

s = s1;

fig = figure;
A=imread(s);
image(A);
axis equal

loop_break=0;
while loop_break == 0
  figure(1);
  disp('zoom/pan to next point, then press space-bar');
  pause

  s1=input('enter point ID ','s');
  s=strtrim(s1);
  if(strcmp(s,'quit') == 1)
    loop_break=1;
  else
    disp('digitize point');
    figure(1);
    zoom off
    pan off
    [x,y,mbutton]=ginput(1);
    s
    [x y]
    fprintf(fid,'%s %10.1f %10.1f\n',s,x,y);
   end

end
close
fclose(fid);
