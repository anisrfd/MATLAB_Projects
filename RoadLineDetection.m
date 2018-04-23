
r=imread('F:\THESIS\road_image.png');
r(find(r>140))=255; r(find(r<=140))=0; % basic image clean-up converting to binary map
r(:,:,2)=and(r(:,:,2),r(:,:,3));r(:,:,3)=[];
r=and(r(:,:,1),r(:,:,2));
r=logical(~r);                 
% figure(1);imshow(A)
A2=del2(r)
figure(3);imshow(A2)