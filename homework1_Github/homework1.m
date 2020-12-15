%时间：2020.11.25
%功能：画出HSV（HSB）调色板图像
%作者：Xu Hao
%联系方式：xuhao_optics@zju.edu.cn
%========================================
%H:Hue
%S:Saturation
%V:Value

close all;
clear all;
clc;
%%
%画出方形的HSV图
data1 = (0:1:255);
data2 = (255:-1:0);
[H,S] = meshgrid(data1,data2);
%对HSV三通道进行归一化
V = 1*0.8;
H = H./255;
S = S./255;
%对HSV三通道进行赋值
HSV(:,:,1) = H;
HSV(:,:,2) = S;
HSV(:,:,3) = V;
%将HSV图像转化为RGB图像并显示设置的亮度
image1 = hsv2rgb(HSV);
figure;
imshow(image1);
title(['Image of HSV ( Value = ',num2str(round(V*255)),' )']);
imwrite(image1,['HSV_rect (Value = ',num2str(round(V*255)),').bmp']);

%%
%功能：画出圆形HSV调色板+HSV圆柱
%--------------------------------
%预设大小
scale = 256;
HSV_circle = zeros(scale+1,scale+1,3);
%对圆形HSV调色板进行处理
for i = 1:scale+1
    for j = 1:scale+1
        x = (j-1)-scale*0.5;
        y = ((i-1)-scale*0.5)*(-1);
        %===计算角度===%
        HSV_circle(i,j,1) = atan2(y,x)/(2*pi);
        %===计算距离圆心的距离===%
        HSV_circle(i,j,2) = sqrt( x^2 + y^2 )/(0.5*scale);
        %===给定亮度===%
        V2 = 1;
        HSV_circle(i,j,3) = V2;
        %===对角度进行调整，与常见的调色板保持一致===%
        if HSV_circle(i,j,1)<0
            HSV_circle(i,j,1) = HSV_circle(i,j,1) + 1;
        end
        HSV_circle(i,j,1) = HSV_circle(i,j,1)*(-1) +1.25 ;
        if HSV_circle(i,j,1)<1.75 && HSV_circle(i,j,1)>1
            HSV_circle(i,j,1) = HSV_circle(i,j,1) - 1;
        end
        %===对HSV调色板以外的区域进行处理，这里设置为全白===%
        if HSV_circle(i,j,2)>1
            HSV_circle(i,j,:) = [0,0,1];
        end
    end
end
image2 = hsv2rgb(HSV_circle);
figure;
imshow(image2);
title(['Image of HSV (Circle) ( Value = ',num2str(round(V2*255)),' )']);
imwrite(image2,['HSV_circle (Value = ',num2str(round(V2*255)),').bmp']);

%%

    
    