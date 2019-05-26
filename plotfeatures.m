function [M,a]=plotfeatures(a)
% a=imread('1.jpg');
 a=imresize(a,[256 256]);
% figure;
% imshow(a);
 a=rgb2gray(a);

c=a>200;
c=medfilt2(c,[3 3]);
% imshow(c);
% impixelinfo

LB = 0;
UB = 200;
Iout = xor(bwareaopen(c,LB),  bwareaopen(c,UB));

[r c p]=size(Iout);
% line([1 c], [r/2 r/2])
% hold on
% line([c/2 c/2], [1 r])
bb=[80 82 100 120];
% rectangle('Position',[bb(1),bb(2),bb(3),bb(4)],'EdgeColor','r','LineWidth',2);
col=[81  183  183  81];
row=[81  81 204 204];
% [Col Row]=ginput(4);

% c =Col;
% r =Row;

% Select polygonal region of interest
% BinaryMask = roipoly(Iout,c,r);


% Select region of interest
BW = roipoly(Iout,row,col);  
 	
% figure, imshow(BW);
Inews = Iout.*BW;
% figure, imshow(Inews)
M = (Inews);
[B,L,N] = bwboundaries(M);
% imshow(b); hold on;
% for k=1:length(B),
%    boundary = B{k};
%    if(k > N)
%      plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
%    else
%      plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
%    end
% end
% impixelinfo