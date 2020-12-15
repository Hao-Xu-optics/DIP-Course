%ʱ�䣺2020.11.25
%���ܣ�����HSV��HSB����ɫ��ͼ��
%���ߣ�Xu Hao
%��ϵ��ʽ��xuhao_optics@zju.edu.cn
%========================================
%H:Hue
%S:Saturation
%V:Value

close all;
clear all;
clc;
%%
%�������ε�HSVͼ
data1 = (0:1:255);
data2 = (255:-1:0);
[H,S] = meshgrid(data1,data2);
%��HSV��ͨ�����й�һ��
V = 1*0.8;
H = H./255;
S = S./255;
%��HSV��ͨ�����и�ֵ
HSV(:,:,1) = H;
HSV(:,:,2) = S;
HSV(:,:,3) = V;
%��HSVͼ��ת��ΪRGBͼ����ʾ���õ�����
image1 = hsv2rgb(HSV);
figure;
imshow(image1);
title(['Image of HSV ( Value = ',num2str(round(V*255)),' )']);
imwrite(image1,['HSV_rect (Value = ',num2str(round(V*255)),').bmp']);

%%
%���ܣ�����Բ��HSV��ɫ��+HSVԲ��
%--------------------------------
%Ԥ���С
scale = 256;
HSV_circle = zeros(scale+1,scale+1,3);
%��Բ��HSV��ɫ����д���
for i = 1:scale+1
    for j = 1:scale+1
        x = (j-1)-scale*0.5;
        y = ((i-1)-scale*0.5)*(-1);
        %===����Ƕ�===%
        HSV_circle(i,j,1) = atan2(y,x)/(2*pi);
        %===�������Բ�ĵľ���===%
        HSV_circle(i,j,2) = sqrt( x^2 + y^2 )/(0.5*scale);
        %===��������===%
        V2 = 1;
        HSV_circle(i,j,3) = V2;
        %===�ԽǶȽ��е������볣���ĵ�ɫ�屣��һ��===%
        if HSV_circle(i,j,1)<0
            HSV_circle(i,j,1) = HSV_circle(i,j,1) + 1;
        end
        HSV_circle(i,j,1) = HSV_circle(i,j,1)*(-1) +1.25 ;
        if HSV_circle(i,j,1)<1.75 && HSV_circle(i,j,1)>1
            HSV_circle(i,j,1) = HSV_circle(i,j,1) - 1;
        end
        %===��HSV��ɫ�������������д�����������Ϊȫ��===%
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

    
    