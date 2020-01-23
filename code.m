function varargout = code(varargin)
% CODE MATLAB code for code.fig
%      CODE, by itself, creates a new CODE or raises the existing
%      singleton*.
%
%      H = CODE returns the handle to a new CODE or the handle to
%      the existing singleton*.
%
%      CODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CODE.M with the given input arguments.
%
%      CODE('Property','Value',...) creates a new CODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before code_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to code_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help code

% Last Modified by GUIDE v2.5 03-Sep-2019 19:03:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @code_OpeningFcn, ...
                   'gui_OutputFcn',  @code_OutputFcn, ...
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


% --- Executes just before code is made visible.
function code_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to code (see VARARGIN)

%创建一个编辑框
% uicontrol('style','edit','backgroundcolor',[1 1 1],'position',...
% [20 20 50 20], 'tag','myedit','string','i love','horizontalalignment','left');

% UIWAIT makes code wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% ha=axes('units','pixels','position',[0 0 1 1],'tag','axes1');
x=0:0.1:2*pi;y=cos(2*pi*x);
% axes(handles.axes1);
% plot(x,y);

set(handles.figure1,'WindowScrollWheel',@(hObject,eventdata)code('figure1_WindowScrollWheelFcn',hObject,eventdata,guidata(hObject)))

handles.uipanel1=uipanel(handles.figure1,'units','pixels','position',[10,10, 700, 400] ,...
    'title','','bordertype','none');
handles.uipanel2=uipanel(handles.figure1,'units','pixels','position',[10,-400, 500, 800] ,...
    'title','','bordertype','none','parent',handles.uipanel1,'backgroundcolor',[0.6,1,0.3]);

handles.slider1=uicontrol('style','slider', 'tag','slider1',...
    'Callback',@(hObject,eventdata)code('slider1_Callback',hObject,eventdata,guidata(hObject)));
set(handles.slider1,'units','pixels','position',[600, 0, 20, 460], 'value',1,'parent',handles.figure1);
% x=1:0.1:2*pi;y=cos(x);
% handles.axes10=axes;
% % handles.axes2=axes;
% set(handles.axes10,'parent',handles.uipanel2,'Position',[0.1 0.15 0.7 0.1]);
% set(handles.axes2,'parent',handles.uipanel2,'Position',[.35 .35 .6 .6]);
% plot(handles.axes1,x,y);
% plot(handles.axes2,x,y);
% set(handles.axes1,'Parent',handles.uipanel);
% handles.axes1=axes1('units','pixels','position',[0 0 1 1],'backgroundcolor',[1,1,0.3]);

% handles.texts = cell(6,1);
% for i=1:6
% %     handles.texts{i} = uicontrol(handles.uipanel2,'units','pixels','position',...
% %         [100,1000-50*i, 80,40],'style','text','string',['text ',num2str(i)],'backgroundcolor',...
% %         [0.6,0.3,0.3],'foregroundcolor',[1,1,1],'fontsize',20);
%     handles.axes{i}=axes;
%     set(handles.axes{i},'parent',handles.uipanel2,'Position',[0.1 0.14*i 0.7 0.1]);
%     title(handles.axes{i},num2str(i));
%     p=get(handles.axes{i},'position')
% end
% plot(handles.axes{1},x,y);
% plot(handles.axes{6},x,cos(1000*x*2*pi));

% ps=get(handles.axes1,'position')
% pl=get(handles.slider1,'value')

 handles.axes1=axes;
 set(handles.axes1,'parent',handles.uipanel2,'Position',[0.1 0.1 0.7 0.1]);
 x=1:0.1:4*pi;
 y1=cos(x);
 y2=sin(x);
 y3=y1+y2;
 subplot(3,1,1);
 plot(x,y1);
  subplot(3,1,2);
 plot(x,y2);
  subplot(3,1,3);
 plot(x,y3);

% Choose default command line output for code
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = code_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

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
pos = get(hObject,'value')
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



