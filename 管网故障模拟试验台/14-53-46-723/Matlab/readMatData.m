% 第1列(设备):1 表示 COM3,9600,50(c5ec33eb-294d-48a0-85e2-8794bb598ee2)   
% 第2列:加速度X(g)
% 第3列:加速度Y(g)
% 第4列:加速度Z(g)
% 第5列:角速度X(°/s)
% 第6列:角速度Y(°/s)
% 第7列:角速度Z(°/s)
% 第8列:X轴振动速度(mm/s)
% 第9列:Y轴振动速度(mm/s)
% 第10列:Z轴振动速度(mm/s)
% 第11列:X轴振动角度(°)
% 第12列:Y轴振动角度(°)
% 第13列:Z轴振动角度(°)
% 第14列:X轴振动位移(um)
% 第15列:Y轴振动位移(um)
% 第16列:Z轴振动位移(um)
% 第17列:X轴振动频率
% 第18列:Y轴振动频率
% 第19列:Z轴振动频率
% 第20列:片上时间   以开始时间作为起点，每条数据与开始时间的间隔（单位为秒）
% 第21列:温度(℃)
% 函数调用：a=readMatData;
function d = readMatData(file)

    if nargin<1
        disp('默认数据')
        file='data.mat';
    else
        disp(file);
    end

    disp('加载mat文件')
    load('data.mat')
    S=whos;
    len = length(S)-1;
    dend = eval(S(len).name);
    d1 = eval(S(1).name);
    len_m = length(d1);
    len_n = length(d1(1,:));

    d=zeros(len_m*(len-1)+length(dend),len_n);
    %h=waitbar(0,'数据合并中……');
    for i=1:len-1
        dTemp = eval(S(i).name);
        d(len_m*(i-1)+1:len_m*i,:)=[dTemp];
        m=len-1;
        %p=fix(i/(m)*len_m)/100; %这样做是可以让进度条的%位数为2位
        %str=['正在合并，目前进度为 ',num2str(p),' %，完成 ',num2str(i),'/',num2str(m)];%进度条上显示的内容
        %waitbar(i/m,h,str);
    end
    d(len_m*(len-1)+1:len_m*(len-1)+length(dend),:)=dend;

end