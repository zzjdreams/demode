
function varargout = shuzi(varargin)
% SHUZI MATLAB code for shuzi.fig
%      SHUZI, by itself, creates a new SHUZI or raises the existing
%      singleton*.
%
%      H = SHUZI returns the handle to a new SHUZI or the handle to
%      the existing singleton*.
%
%      SHUZI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHUZI.M with the given input arguments.
%
%      SHUZI('Property','Value',...) creates a new SHUZI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before shuzi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to shuzi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help shuzi

% Last Modified by GUIDE v2.5 01-Dec-2019 14:28:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @shuzi_OpeningFcn, ...
                   'gui_OutputFcn',  @shuzi_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% -------------------------------------------------------------------------

% --- Executes just before shuzi is made visible.
function shuzi_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to shuzi (see VARARGIN)

% addpath('MSK');

btn_img=imread('013.jpg');
set(handles.pushbutton1,'CData',btn_img);
set(handles.pushbutton2,'CData',btn_img);
 
%使用全局变量global进行传参
%获取子GUI的参数
global T;
global f;
global t;
global inp;
global Psnr;

handles.T=T;
handles.f=f;
handles.inp=inp;
handles.Psnr=Psnr;

uiresume(handles.figure1);

% Choose default command line output for shuzi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

t=0:0.01:6*T;


% set(handles.pushbutton2,'String',inp);

% ----------------------------------------------------------------------------------


set(handles.figure1,'WindowScrollWheel',@(hObject,eventdata)shuzi...
    ('figure1_WindowScrollWheelFcn',hObject,eventdata,guidata(hObject)))
% 添加滚轮事件
handles.uipanel1=uipanel(handles.figure1,'units','pixels','position',[10,10, 500, 400] ,...
    'title','若加载不出来请点击_刷新图形_','titleposition','centertop','bordertype','none','backgroundcolor',[0,1,0]);
% 创建 uipanel1 并为figure的子关系
handles.uipanel2=uipanel(handles.figure1,'units','pixels','position',[0,-400, 500, 800] ,...
    'title','','bordertype','none','parent',handles.uipanel1,'backgroundcolor',[0.6,1,0.3],'bordertype','beveledout');
% 创建 uipanel2 并为uipanel1的子关系
handles.slider1=uicontrol('style','slider', 'tag','slider1',...
    'Callback',@(hObject,eventdata)shuzi('slider1_Callback',hObject,eventdata,guidata(hObject)));
set(handles.slider1,'units','pixels','position',[510, 0, 20, 410], 'value',1,'parent',handles.figure1);
% 创建 slider1 并为figure的子关系,用来控制uipanel2上下滑动
    handles.axes1=axes;
    set(handles.axes1,'parent',handles.uipanel2,'Position',[0.06 0.1 0.7 0.1]);
% 创建 axes1 并为uipanel2的子关系,主要用来显示波形图
    
    st=str2num(inp(:))';
    
    show_signal(t,T,st,f);
    
% ----------------------------------------------------------------------------------

% Choose default command line output for shuzi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes shuzi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = shuzi_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T;
global f;
global t;
global inp;
t=0:0.01:6*T;
st=str2num(inp(:))';
show_signal(t,T,st,f);
set(handles.uipanel1, 'title','');



% global y1 x;
% axes(handles.axes1);
% plot(x,y1)
% 
% global y2;
% axes(handles.axes2);
% plot(x,y2)

% [I,map,alpha] = imread('2.png');
% h = imshow(I);
% set(h,'AlphaData',alpha)
% BG = get(gcf,'defaultuicontrolback');
% [I,map] = imread('2.png','BackgroundColor',BG);
% 
% i=1;
% if i==1
%     figure(1)
%     FSK();
%     i=0;
% end
% if i==0
%     delete(handles.figure1);
%     i=1;
% end


% --------------------------------------------------------------------
function ASK_Callback(hObject, eventdata, handles)
% hObject    handle to ASK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% h=gcf;ASK;close(h);
global inp;
global f;
global T;
handles.T=T;
handles.f=f;
handles.inp=inp;
uiresume(handles.figure1);
figure()
ASK(inp,f,T);


% --------------------------------------------------------------------
function FSK_Callback(hObject, eventdata, handles)
% hObject    handle to FSK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% global value;
% uiresume(handles.figure1);
% % if value==nan
% %     value='000000'
% figure(2)
% FSK(value);

global inp;
global f;
global T;
uiresume(handles.figure1);
figure()
FSK(inp,f,T);


% --------------------------------------------------------------------
function PSK_Callback(hObject, eventdata, handles)
% hObject    handle to PSK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% global value;
% uiresume(handles.figure1);
% % if value==nan
% %     value='000000'
% figure(3)
% PSK(value);
global inp;
global f;
global T;
uiresume(handles.figure1);
figure()
PSK(inp,f,T);


% --------------------------------------------------------------------
function MSK_Callback(hObject, eventdata, handles)
% hObject    handle to MSK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure();
mod_msk();


% --------------------------------------------------------------------
function QAM_Callback(hObject, eventdata, handles)
% hObject    handle to QAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inp;
global f;
global T;
uiresume(handles.figure1);
figure();
QAM(inp);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
subGUI;


% --------------------------------------------------------------------
function binaryContrast_Callback(hObject, eventdata, handles)
% hObject    handle to binaryContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ASK_compare_Callback(hObject, eventdata, handles)
% hObject    handle to ASK_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inp;
global f;
global T;
uiresume(handles.figure1);
figure()
ASK_compare(inp,f,T);


% --------------------------------------------------------------------
function FSK_compare_Callback(hObject, eventdata, handles)
% hObject    handle to FSK_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inp;
global f;
global T;
uiresume(handles.figure1);
figure()
FSK_compare(inp,f,T);


% --------------------------------------------------------------------
function PSK_compare_Callback(hObject, eventdata, handles)
% hObject    handle to PSK_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inp;
global f;
global T;
uiresume(handles.figure1);
figure()
PSK_compare(inp,f,T);


% ----------------------------------------------------------------
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%　取得滚动条的值
pos = get(hObject,'value');
%　设置panel的位置（左下角点的纵坐标)。
set(handles.uipanel2,'position',[0,-400*pos,500,800]);
guidata(hObject,handles)

function figure1_WindowScrollWheelFcn(hObject, eventdata, handles)
% 获取目前滚动条的值
slidervalue = get(handles.slider1,'value');

% 获取鼠标滚轮的值，向前滚为正，向后滚为负
scrollvalue = eventdata.VerticalScrollCount/10;

% 确定滚动量
movevalue = slidervalue - scrollvalue;

% 限制滚动范围（防止整个面板都滚出图形）
if movevalue >1
    movevalue = 1;
elseif movevalue < 0
    movevalue = 0;
end

% 使滚动条的方块的位置与滚轮的滚动同步
set(handles.slider1,'value',movevalue);
% 获取figure和panel的位置
panel1pos = get(handles.uipanel1,'position');
panel2pos = get(handles.uipanel2,'position');

% 更新panel的位置
panel2pos(2) = -(panel2pos(4)-panel1pos(4))*movevalue;
set(handles.uipanel2,'position',panel2pos);

get(handles.uipanel2,'position')
guidata(hObject,handles);


% --------------------------------------------------------------------
function demodulation_Callback(hObject, eventdata, handles)
% hObject    handle to demodulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ASK_demodulation_Callback(hObject, eventdata, handles)
% hObject    handle to ASK_demodulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inp;
global f;
global T;
global Psnr;
uiresume(handles.figure1);
figure()
ASK_demodulation(inp,f,T,Psnr);


% --------------------------------------------------------------------
function FSK_demodulation_Callback(hObject, eventdata, handles)
% hObject    handle to FSK_demodulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inp;
global f;
global T;
global Psnr;
uiresume(handles.figure1);
figure()
FSK_demodulation(inp,f,T,Psnr);

% --------------------------------------------------------------------
function PSK_demodulation_Callback(hObject, eventdata, handles)
% hObject    handle to PSK_demodulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inp;
global f;
global T;
global Psnr;
uiresume(handles.figure1);
figure()
PSK_demodulation(inp,f,T,Psnr);



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%添加背景图片
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down');
ii=imread('3.png');
%设置程序的背景图为1.jpg
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','off');
