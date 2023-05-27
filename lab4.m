function varargout = lab4(varargin)
% LAB4 MATLAB code for lab4.fig
%      LAB4, by itself, creates a new LAB4 or raises the existing
%      singleton*.
%
%      H = LAB4 returns the handle to a new LAB4 or the handle to
%      the existing singleton*.
%
%      LAB4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB4.M with the given input arguments.
%
%      LAB4('Property','Value',...) creates a new LAB4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab4

% Last Modified by GUIDE v2.5 27-May-2023 21:58:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab4_OpeningFcn, ...
                   'gui_OutputFcn',  @lab4_OutputFcn, ...
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


% --- Executes just before lab4 is made visible.
function lab4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab4 (see VARARGIN)

% Choose default command line output for lab4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
[file path]=uigetfile('*.*');
img=imread([path file]);
img= im2gray(img);
axes(handles.axes1);
imshow(img);

% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;

b1=edge(img,"sobel");
b2=edge(img,"canny");
axes(handles.axes2);
imshow(b1);
axes(handles.axes3);
imshow(b2);
